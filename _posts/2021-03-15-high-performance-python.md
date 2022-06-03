---
title: "High Performance Python part 1/?"
layout: post
date: 2021-03-15
projects: true
tag:
    - tech
    - programming
    - python
    - profiling
    - garbage collection
    - python_internals
    - highperformancepython
    - personaldevelopment
category: project
author: zacknovak
description: What i've learned in the first 50 pages of High Performance Python
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

I'm approximetly 1/8th of the way through [High Performance Python](https://www.amazon.com/High-Performance-Python-Performant-Programming/dp/1492055026).

Someone else already converted all of the code in the book to [github](https://github.com/mynameisfiber/high_performance_python/), but warning: its in python2.7.

# A summary so far

## Profiling tools:

### timeit

timeit module: records time of whatever is run in it.

```python
from julia_set_no_timefn import calc_pure_python
import timeit

rough_exec_time = timeit.timeit(lambda: calc_pure_python(draw_output=False, desired_width=1000, max_iterations=300), number=10)
print(rough_exec_time)
```

### cProfile

cProfile: shows number of calls, total time %, and time in nanoseconds per function.

```python
import os

# cProfile is a built in profiling tool
# Hooks into virtual machine in CPython and measures time to run every function that it ses
os.system("python3 -m cProfile -s cumulative somefile.py")
# allows you to see which functions are most consuming (cumtime & ncalls are v important)

# save output
os.system("python3 -m cProfile -o profile.stats -s cumulative julia_set_no_timefn.py")
import pstats
p = pstats.Stats("profile.stats")
p.sort_stats("cumulative")
p.print_stats()
# Trace calling function
p.print_callers()


```

### snakeviz

snakeviz: a visualization tool that can be used to show profiling results in a graph.

```python
# Snakeviz Example
# pip install snakeviz
import os

os.system("snakeviz profile.stats")
```

### line_profiler

line_profiler: shows number of calls, total time %, and time in nanoseconds per line.

```python
# pip install line_profiler
import os

# os.system("kernprof -l -v line_profiler_set.py")
# kernprof  adds a ton of time but shows line by line breakdown of time
# % Time column is most helpful


os.system("kernprof -l -v line_profiler_set_2.py")
# Broke up while statement to further analyze
```

## Tuples vs lists

Tuples run 5 - 10x faster than lists because of python's garbage collection and memory allocation.

#### Memory allocation:

When you create a list, python actually creates that list + some more memory as it thinks you'll append to the list / modify it / etc. When you do append to that list, it first checks to see if it's there enough size left, then creates a new list with some more memory on top of it, then copies the old list to it, then does the append, and finally destroys the old list (very expensive).

Python must allocate and copy the tuple every time it is appended, as opposed to only when the extra memory allocated to it expires like in lists. As a result, no in place appends exist. Not storing the extra memory uses fewer resources. Additionally, tuples don't need to keep track about their current state leading to more speed advantages.

#### Garbage collection / resource caching:

Python is garbage collected, so when a variable isnt used anymore, python frees the memory allocated to it and allows other apps or variables to use the memory. For tuples of size 1 - 20, when they are no longer in use, space isn't given back and is reserved for future tuples. So, tuples can be easily created and destroyed since they avoid communication with the OS up to a certain size.

See below for a quick reference:

```python
import timeit
list_test = timeit.timeit('[0,1,2,3,4,5,6,7,8,9]', number=10000)
tuple_test = timeit.timeit('(0,1,2,3,4,5,6,7,8,9)', number=10000)
print(f"Creation of the list usually took {list_test} nanoseconds.")
print(f"Creation of the tuple usually took {tuple_test} nanoseconds.")
```

### julia file

```python
"""Julia set generator without optional PIL-based image drawing"""
"""CPU BOUND PROBLEM"""
import time

# area of complex space to investigate
x1, x2, y1, y2 = -1.8, 1.8, -1.8, 1.8
c_real, c_imag = -0.62772, -.42193

def calculate_z_serial_purepython(maxiter, zs, cs):
    """Calculate output list using Julia update rule"""
    output = [0] * len(zs)
    for i in range(len(zs)):
        n = 0
        z = zs[i]
        c = cs[i]
        while abs(z) < 2 and n < maxiter:
            z = z * z + c
            n += 1
        output[i] = n
    return output


def calc_pure_python(draw_output, desired_width, max_iterations):
    """Create a list of complex co-ordinates (zs) and complex parameters (cs), build Julia set and display"""
    x_step = (float(x2 - x1) / float(desired_width))
    y_step = (float(y1 - y2) / float(desired_width))
    x = []
    y = []
    ycoord = y2
    while ycoord > y1:
        y.append(ycoord)
        ycoord += y_step
    xcoord = x1
    while xcoord < x2:
        x.append(xcoord)
        xcoord += x_step
    # build a list of co-ordinates and the initial condition for each cell.
    # Note that our initial condition is a constant and could easily be removed,
    # we use it to simulate a real-world scenario with several inputs to our
    # function
    zs = []
    cs = []
    for ycoord in y:
        for xcoord in x:
            zs.append(complex(xcoord, ycoord))
            cs.append(complex(c_real, c_imag))

    print(f"Length of x {len(x)}")
    print(f"Total elements: {len(zs)}")
    start_time = time.time()
    output = calculate_z_serial_purepython(max_iterations, zs, cs)
    end_time = time.time()
    secs = end_time - start_time
    print(f"calculate_z_serial_purepython took  {secs} seconds")

    # this sum is expected for 1000^2 grid with 300 iterations
    assert sum(output) == 33219980


if __name__ == "__main__":
    # Calculate the Julia set using a pure Python solution with
    # reasonable defaults for a laptop
    # set draw_output to True to use PIL to draw an image
    calc_pure_python(draw_output=False, desired_width=1000, max_iterations=300)
```
