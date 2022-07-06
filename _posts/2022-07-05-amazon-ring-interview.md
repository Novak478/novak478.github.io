---
title: "Ring interview: post mortem"
layout: post
date: 2022-07-05
projects: true
tag:
    - interviewing
    - ring
    - amazon
category: blog
author: zacknovak
description: I interviewed with Ring as a Data Engineer. Here is what the Ring team said might be questions, what they actually asked, and my answers (or in some cases, "I don't know that" lol)
---

# Potential Questions

## Leadership Principle Questions

1. Describe a difficult interaction you had with a customer. How did you deal with it? What was the outcome? How would you handle it differently?
2. Tell me about a time when you went above and beyond for a customer. Why did you do it? How did the customer respond? What was the outcome?
3. Give me an example of when you were able to anticipate a customer need with a solution/product they didn't know they needed/wanted yet. How did you know they needed this? How did they respond?
4. Tell me about a time when you took on something significant outside your area of responsibility. Why was it important? What was the outcome?
5. Describe a time when you didn't think you were going to meet a commitment you promised. How did you identify the risk and communicate it to stakeholders? Is there anything you would do differently?
6. Give me an example of an initiative you undertook because you saw that it could benefit the whole company or your customers, but wasn’t within any group’s individual responsibility so nothing was being done.
7. Give me an example of a complex problem you solved with a simple solution. What made the problem complex? How do you know your solution addressed the problem?
8. Describe the most innovative thing you’ve done and why you thought it was innovative. Ask for one or two more examples to see if it's a pattern of innovative thinking. What was the problem it was solving? What was innovative about it?
9. Tell me about a time when you were able to make something simpler for customers. What drove you to implement this change? What was the impact?
10. Tell me about a time you wouldn’t compromise on achieving a great outcome when others felt something was good enough. What was the situation?
11. Tell me about a time when you were unsatisfied with the status quo. What did you do to change it? What was the impact? Would you do anything differently in the future?
12. Tell me about a time when you worked to improve the quality of a product / service / solution that was already getting good customer feedback. Why did you think it needed improvement? How did customers react?
13. Give me an example of a goal you’ve had where you wish you had done better. What was the goal and how could you have improved on it?
14. Give me an example of a calculated risk that you have taken where speed was critical. What was the situation and how did you handle it? What steps did you take to mitigate the risk? What was the outcome? Knowing what you know now, would you have done anything differently?
15. Tell me about a time when you worked against tight deadlines and didn't have time to consider all options before making a decision. How much time did you have? What approach did you take? What did you learn from the situation?
16. Describe a situation where you made an important business decision without consulting your manager. What was the situation and how did it turn out? Would you have done anything differently?
17. What is the coolest thing you have learned on your own that has helped you better perform your job?
18. Tell me about a time when you realized you needed to have a deeper level of subject matter expertise to do your job well?
19. Tell me of a time when you took on work outside of your comfort area and found it rewarding?
20. Tell me about a time when you had to communicate a change in direction that you anticipated people would have concerns with. What did you do to understand the concerns and mitigate them? Were there any changes you made along the way after hearing these concerns? How did you handle questions and/or resistance? Were you able to get people comfortable with the change?
21. Give me an example of a tough or critical piece of feedback you received. What was it and what did you do about it?
22. Describe a time when you needed to influence a peer who had a differing opinion about a shared goal. What did you do? What was the outcome?
23. Tell me about a piece of direct feedback you recently gave to a colleague. How did he or she respond? How do you like to receive feedback from coworkers or managers?
24. Tell me about a time when you were trying to understand a complex problem on your team and you had to dig into the details to figure it out. Who did you talk with or where did you have to look to find the most valuable information? How did you use that information to help solve the problem?
25. Tell me about a situation that required you to dig deep to get to the root cause. How did you know you were focusing on the right things? What was the outcome? Would you have done anything differently?
26. Tell me about a problem you had to solve that required in-depth thought and analysis. How did you know you were focusing on the right things? What was the outcome? Would you have done anything differently?
27. Give me an example of a time when you were able to deliver an important project under a tight deadline. What sacrifices did you have to make to meet the deadline? How did they impact the final deliverable? What was the final outcome?
28. Tell me about a time when you had significant, unanticipated obstacles to overcome in achieving a key goal. What was the obstacle? Were you eventually successful? Knowing what you know now, is there anything you would have done differently?
29. Tell me about a time when you not only met a goal but considerably exceeded expectations. How were you able to do it? What challenges did you have to overcome?
30. Tell me about a time when you didn't have enough data to make the right decision. What did you do? What path did you take? Did the decision turn out to be the correct one?
31. Tell me about a strategic decision you had to make without clear data or benchmarks. How did you make your final decision? What alternatives did you consider? What were the tradeoffs of each? How did you mitigate risk?
32. We don't always make the right decision all the time. Tell me about a time when you made a bad decision.
33. Tell me about a time when you discovered that your idea was not the best course of action. What was your idea? Why wasn't your idea the best course of action? How did you find out it was not the correct path? What was the best course of action? Who provided it? What did you learn from the experience?
34. Tell me about time when you were working on an initiative or goal and saw an opportunity to do something much bigger or better than the initial focus. Did you take that opportunity? Why or why not? What was the outcome?
35. Tell me about a time when you strongly disagreed with your manager or peer on something you considered very important to the business. What was it and how did you handle it? Knowing what you know now, would you do anything differently?
36. Describe a time when you took an unpopular stance in a meeting with peers and your leader. What was it? Why did you feel strongly about it? What did you do? What was the outcome?
37. Give me an example of a time you provided feedback to develop the strengths of someone on your team. Were you able to positively impact their performance?

### General questions

#### What is Big O notation

O(n) is Big O Notation and refers to the complexity of a given algorithm. n refers to the size of the input, in your case it's the number of items in your list.

O(n) means that your algorithm will take on the order of n operations to insert an item. e.g. looping through the list once (or a constant number of times such as twice or only looping through half).

O(1) means it takes a constant time, that it is not dependent on how many items are in the list.

O(log N) basically means time goes up linearly while the n goes up exponentially. So if it takes 1 second to compute 10 elements, it will take 2 seconds to compute 100 elements, 3 seconds to compute 1000 elements, and so on. ​It is O(log n) when we do divide and conquer type of algorithms e.g binary search.

O(n^2) means that for every insert, it takes n\*n operations. i.e. 1 operation for 1 item, 4 operations for 2 items, 9 operations for 3 items. As you can see, O(n^2) algorithms become inefficient for handling large number of items.

For lists O(n) is not bad for insertion, but not the quickest. Also note that O(n/2) is considered as being the same as O(n) because they both grow at the same rate with n.

https://stackoverflow.com/questions/1909307/what-does-on-mean

#### Data Lake

A data lake is a centralized repository that allows you to store all your structured and unstructured data at any scale. You can store your data as-is, without having to first structure the data, and run different types of analytics—from dashboards and visualizations to big data processing, real-time analytics, and machine learning to guide better decisions.

#### Design patterns

##### Singleton

This pattern involves a single class which is responsible to create an object while making sure that only single object gets created. This class provides a way to access its only object which can be accessed directly without need to instantiate the object of the class.

##### Factory

In Factory pattern, we create object without exposing the creation logic to the client and refer to newly created object using a common interface.

##### Bridge

https://www.geeksforgeeks.org/bridge-design-pattern/

##### Visitor

It is used when we have to perform an operation on a group of similar kind of Objects. With the help of visitor pattern, we can move the operational logic from the objects to another class.

The visitor pattern consists of two parts:

a method called Visit() which is implemented by the visitor and is called for every element in the data structure
visitable classes providing Accept() methods that accept a visitor

https://www.geeksforgeeks.org/visitor-design-pattern/

##### Command

Command is a behavioral design pattern that turns a request into a stand-alone object that contains all information about the request. This transformation lets you pass requests as a method arguments, delay or queue a request’s execution, and support undoable operations.

https://refactoring.guru/design-patterns/command

##### Proxy

Proxy is a structural design pattern that lets you provide a substitute or placeholder for another object. A proxy controls access to the original object, allowing you to perform something either before or after the request gets through to the original object.

https://refactoring.guru/design-patterns/proxy

##### Observer

Observer pattern is used when there is one-to-many relationship between objects such as if one object is modified, its depenedent objects are to be notified automatically. Observer pattern falls under behavioral pattern category.

https://www.tutorialspoint.com/design_pattern/observer_pattern.htm

##### Adapter

Adapter is a structural design pattern that allows objects with incompatible interfaces to collaborate.

https://refactoring.guru/design-patterns/adapter

## OS questions

### Processes and threads

**Process**
Each process provides the resources needed to execute a program. A process has a virtual address space, executable code, open handles to system objects, a security context, a unique process identifier, environment variables, a priority class, minimum and maximum working set sizes, and at least one thread of execution. Each process is started with a single thread, often called the primary thread, but can create additional threads from any of its threads.

### synchronization

Synchronization is the way by which processes that share the same memory space are managed in an operating system. It helps maintain the consistency of data by using variables or hardware so that only one process can make changes to the shared memory at a time

### paging

When a process wants to access an address, it is using a virtual address. That address is converted by the processor into a physical one. The way to do so is by means of using page tables. Each process has an associated page table that translates its virtual addresses into physical ones. Since each process has a different page table, the OS can enforce that two virtual addresses (even if potentially equal) from different processes will not be mapped into the same physical addresses.

### multithreading

Multithreading enables us to run multiple threads concurrently.

## Data Structures:

### Array

#### Linked List

Linked lists serve a variety of purposes in the real world. They can be used to implement queues or stacks as well as graphs. Their time complexity is always constant: O(1).

Creation:

```python
from collections import deque
llist = deque("abcde")
llist
#deque(['a', 'b', 'c', 'd', 'e'])
llist.append("f")
# deque(['a', 'b', 'c', 'd', 'e', 'f'])

llist.pop()
# 'f'
llist.appendleft("z")
# deque(['z', 'a', 'b', 'c', 'd', 'e'])

llist.popleft()
# 'z'
```

#### Heap

Heap is a special tree structure in which each parent node is less than or equal to its child node. Then it is called a Min Heap. If each parent node is greater than or equal to its child node then it is called a max heap. It is very useful is implementing priority queues where the queue item with higher weightage is given more priority in processing.

```python
import heapq

H = [21,1,45,78,3,5]
# Use heapify to rearrange the elements
heapq.heapify(H)
print(H)
# [1, 3, 5, 78, 21, 45]
# Add element
heapq.heappush(H,8)
print(H)
# [1, 3, 5, 78, 21, 45, 8]
# Remove element from the heap at index position 1
heapq.heappop(H)
print(H)
# [1, 5, 78, 21, 45, 8]
# Replace an element - heaps always replace the smallest element
heapq.heapreplace(H,6)
print(H)
# [6, 5, 78, 21, 45, 8]

```

#### Hash Table

Hash tables are a type of data structure in which the address or the index value of the data element is generated from a hash function. That makes accessing the data faster as the index value behaves as a key for the data value. In other words Hash table stores key-value pairs but the key is generated through a hashing function.

#### Stack

For a stack, you use a Last-In/First-Out (LIFO) approach, meaning that the last element inserted in the list is the first to be retrieved:

```python
>>> from collections import deque
>>> history = deque()

history.appendleft("https://realpython.com/")
history.appendleft("https://realpython.com/pandas-read-write-files/")
history.appendleft("https://realpython.com/python-csv/")
history
# deque(['https://realpython.com/python-csv/',
#       'https://realpython.com/pandas-read-write-files/',
#       'https://realpython.com/'])

history.popleft()
# 'https://realpython.com/python-csv/'

history.popleft()
# 'https://realpython.com/pandas-read-write-files/'

history
# deque(['https://realpython.com/'])
```

#### Queue

For a queue, you use a First-In/First-Out (FIFO) approach. That means that the first element inserted in the list is the first one to be retrieved:

```python
from collections import deque
queue = deque()
# deque([])

queue.append("Mary")
queue.append("John")
queue.append("Susan")
queue
# deque(['Mary', 'John', 'Susan'])
queue.popleft()
# 'Mary'

queue
# deque(['John', 'Susan'])

queue.popleft()
# 'John'

queue
# deque(['Susan'])
```

#### Trie

## Algorithms

### Sorting

#### Bubble Sort

Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in the wrong order. This algorithm is not suitable for large data sets as its average and worst case time complexity is quite high.

```python
# An optimized version of Bubble Sort
def bubbleSort(arr):
    n = len(arr)

    # Traverse through all array elements
    for i in range(n):
        swapped = False

        # Last i elements are already
        #  in place
        for j in range(0, n-i-1):

            # traverse the array from 0 to
            # n-i-1. Swap if the element
            # found is greater than the
            # next element
            if arr[j] > arr[j+1] :
                arr[j], arr[j+1] = arr[j+1], arr[j]
                swapped = True

        # IF no two elements were swapped
        # by inner loop, then break
        if swapped == False:
            break

# Driver code to test above
arr = [64, 34, 25, 12, 22, 11, 90]

bubbleSort(arr)

print ("Sorted array :")
for i in range(len(arr)):
    print ("%d" %arr[i],end=" ")
```

#### Merge Sort

The Merge Sort algorithm is a sorting algorithm that is considered as an example of the divide and conquer strategy. So, in this algorithm, the array is initially divided into two equal halves and then they are combined in a sorted manner. We can think of it as a recursive algorithm that continuously splits the array in half until it cannot be further divided. This means that if the array becomes empty or has only one element left, the dividing will stop, i.e. it is the base case to stop the recursion. If the array has multiple elements, we split the array into halves and recursively invoke the merge sort on each of the halves. Finally, when both the halves are sorted, the merge operation is applied. Merge operation is the process of taking two smaller sorted arrays and combining them to eventually make a larger one.

Time Complexity: O(n logn), Sorting arrays on different machines. Merge Sort is a recursive algorithm and time complexity can be expressed as following recurrence relation.

Useful for linked lists due to difference in memory allocation of arrays and linked lists.

```python
def mergeSort(arr):
    if len(arr) > 1:

         # Finding the mid of the array
        mid = len(arr)//2

        # Dividing the array elements
        L = arr[:mid]

        # into 2 halves
        R = arr[mid:]

        # Sorting the first half
        mergeSort(L)

        # Sorting the second half
        mergeSort(R)

        i = j = k = 0

        # Copy data to temp arrays L[] and R[]
        while i < len(L) and j < len(R):
            if L[i] < R[j]:
                arr[k] = L[i]
                i += 1
            else:
                arr[k] = R[j]
                j += 1
            k += 1

        # Checking if any element was left
        while i < len(L):
            arr[k] = L[i]
            i += 1
            k += 1

        while j < len(R):
            arr[k] = R[j]
            j += 1
            k += 1

# Code to print the list


def printList(arr):
    for i in range(len(arr)):
        print(arr[i], end=" ")
    print()


# Driver Code
if __name__ == '__main__':
    arr = [12, 11, 13, 5, 6, 7]
    print("Given array is", end="\n")
    printList(arr)
    mergeSort(arr)
    print("Sorted array is: ", end="\n")
    printList(arr)
```

#### Quick Sort

Like Merge Sort, QuickSort is a Divide and Conquer algorithm. It picks an element as pivot and partitions the given array around the picked pivot. There are many different versions of quickSort that pick pivot in different ways.

It is not a stable algorithm. It is preferred over merge sort for arrays but not linked lists because of it's in place sort and memory allocation.

```python
# Function to find the partition position
def partition(array, low, high):

  # Choose the rightmost element as pivot
  pivot = array[high]

  # Pointer for greater element
  i = low - 1

  # Traverse through all elements
  # compare each element with pivot
  for j in range(low, high):
    if array[j] <= pivot:
      # If element smaller than pivot is found
      # swap it with the greater element pointed by i
      i = i + 1

      # Swapping element at i with element at j
      (array[i], array[j]) = (array[j], array[i])

  # Swap the pivot element with the greater element specified by i
  (array[i + 1], array[high]) = (array[high], array[i + 1])

  # Return the position from where partition is done
  return i + 1

# Function to perform quicksort
def quick_sort(array, low, high):
  if low < high:

    # Find pivot element such that
    # element smaller than pivot are on the left
    # element greater than pivot are on the right
    pi = partition(array, low, high)

    # Recursive call on the left of pivot
    quick_sort(array, low, pi - 1)

    # Recursive call on the right of pivot
    quick_sort(array, pi + 1, high)



# Driver code
array = [ 10, 7, 8, 9, 1, 5]
quick_sort(array, 0, len(array) - 1)

print(f'Sorted array: {array}')
```

#### Radix/Bucket Sort

```python
# Python3 program to sort an array
# using bucket sort
def insertionSort(b):
    for i in range(1, len(b)):
        up = b[i]
        j = i - 1
        while j >= 0 and b[j] > up:
            b[j + 1] = b[j]
            j -= 1
        b[j + 1] = up
    return b

def bucketSort(x):
    arr = []
    slot_num = 10 # 10 means 10 slots, each
                  # slot's size is 0.1
    for i in range(slot_num):
        arr.append([])

    # Put array elements in different buckets
    for j in x:
        index_b = int(slot_num * j)
        arr[index_b].append(j)

    # Sort individual buckets
    for i in range(slot_num):
        arr[i] = insertionSort(arr[i])

    # concatenate the result
    k = 0
    for i in range(slot_num):
        for j in range(len(arr[i])):
            x[k] = arr[i][j]
            k += 1
    return x

# Driver Code
x = [0.897, 0.565, 0.656,
     0.1234, 0.665, 0.3434]
print("Sorted Array is")
print(bucketSort(x))
```

### Traversals

#### Depth First Search

Depth-first search is an algorithm for traversing or searching tree or graph data structures. The algorithm starts at the root node (selecting some arbitrary node as the root node in the case of a graph) and explores as far as possible along each branch before backtracking. So the basic idea is to start from the root or any arbitrary node and mark the node and move to the adjacent unmarked node and continue this loop until there is no unmarked adjacent node. Then backtrack and check for other unmarked nodes and traverse them. Finally, print the nodes in the path.

```python
from collections import defaultdict

# This class represents a directed graph using
# adjacency list representation


class Graph:

    # Constructor
    def __init__(self):

        # default dictionary to store graph
        self.graph = defaultdict(list)

    # function to add an edge to graph
    def addEdge(self, u, v):
        self.graph[u].append(v)

    # A function used by DFS
    def DFSUtil(self, v, visited):

        # Mark the current node as visited
        # and print it
        visited.add(v)
        print(v, end=' ')

        # Recur for all the vertices
        # adjacent to this vertex
        for neighbour in self.graph[v]:
            if neighbour not in visited:
                self.DFSUtil(neighbour, visited)

    # The function to do DFS traversal. It uses
    # recursive DFSUtil()
    def DFS(self, v):

        # Create a set to store visited vertices
        visited = set()

        # Call the recursive helper function
        # to print DFS traversal
        self.DFSUtil(v, visited)

# Driver code


# Create a graph given
# in the above diagram
g = Graph()
g.addEdge(0, 1)
g.addEdge(0, 2)
g.addEdge(1, 2)
g.addEdge(2, 0)
g.addEdge(2, 3)
g.addEdge(3, 3)

print("Following is DFS from (starting from vertex 2)")
g.DFS(2)
```

#### Breadth First Search

```python
# Python3 Program to print BFS traversal
# from a given source vertex. BFS(int s)
# traverses vertices reachable from s.
from collections import defaultdict

# This class represents a directed graph
# using adjacency list representation
class Graph:

    # Constructor
    def __init__(self):

        # default dictionary to store graph
        self.graph = defaultdict(list)

    # function to add an edge to graph
    def addEdge(self,u,v):
        self.graph[u].append(v)

    # Function to print a BFS of graph
    def BFS(self, s):

        # Mark all the vertices as not visited
        visited = [False] * (max(self.graph) + 1)

        # Create a queue for BFS
        queue = []

        # Mark the source node as
        # visited and enqueue it
        queue.append(s)
        visited[s] = True

        while queue:

            # Dequeue a vertex from
            # queue and print it
            s = queue.pop(0)
            print (s, end = " ")

            # Get all adjacent vertices of the
            # dequeued vertex s. If a adjacent
            # has not been visited, then mark it
            # visited and enqueue it
            for i in self.graph[s]:
                if visited[i] == False:
                    queue.append(i)
                    visited[i] = True

# Driver code

# Create a graph given in
# the above diagram
g = Graph()
g.addEdge(0, 1)
g.addEdge(0, 2)
g.addEdge(1, 2)
g.addEdge(2, 0)
g.addEdge(2, 3)
g.addEdge(3, 3)

print ("Following is Breadth First Traversal"
                  " (starting from vertex 2)")
g.BFS(2)
```

#### Recursion

### Search

#### Sequential Search (ex: Linear)

Linear search is rarely used practically because other search algorithms such as the binary search algorithm and hash tables allow significantly faster searching compared to Linear search.

```python
def search(arr, n, x):

    for i in range(0, n):
        if (arr[i] == x):
            return i
    return -1


# Driver Code
arr = [2, 3, 4, 10, 40]
x = 10
n = len(arr)

# Function call
result = search(arr, n, x)
if(result == -1):
    print("Element is not present in array")
else:
    print("Element is present at index", result)
```

#### Interval Search (ex: Binary)

Time Complexity: O(log n)

In a nutshell, this search algorithm takes advantage of a collection of elements that is already sorted by ignoring half of the elements after just one comparison.

1. Compare x with the middle element.
2. If x matches with the middle element, we return the mid index.
3. Else if x is greater than the mid element, then x can only lie in the right (greater) half subarray after the mid element. Then we apply the algorithm again for the right half.
4. Else if x is smaller, the target x must lie in the left (lower) half. So we apply the algorithm for the left half.

```python
 Python 3 program for recursive binary search.
# Modifications needed for the older Python 2 are found in comments.

# Returns index of x in arr if present, else -1
def binary_search(arr, low, high, x):

    # Check base case
    if high >= low:

        mid = (high + low) // 2

        # If element is present at the middle itself
        if arr[mid] == x:
            return mid

        # If element is smaller than mid, then it can only
        # be present in left subarray
        elif arr[mid] > x:
            return binary_search(arr, low, mid - 1, x)

        # Else the element can only be present in right subarray
        else:
            return binary_search(arr, mid + 1, high, x)

    else:
        # Element is not present in the array
        return -1

# Test array
arr = [ 2, 3, 4, 10, 40 ]
x = 10

# Function call
result = binary_search(arr, 0, len(arr)-1, x)

if result != -1:
    print("Element is present at index", str(result))
else:
    print("Element is not present in array")
```

##### Jump Search

Like Binary Search, Jump Search is a searching algorithm for sorted arrays. The basic idea is to check fewer elements (than linear search) by jumping ahead by fixed steps or skipping some elements in place of searching all elements.

Binary Search is better than Jump Search, but Jump Search has the advantage that we traverse back only once (Binary Search may require up to O(Log n) jumps, consider a situation where the element to be searched is the smallest element or just bigger than the smallest). So, in a system where binary search is costly, we use Jump Search.

Works only with sorted arrays.

```python
import math

def jumpSearch( arr , x , n ):

    # Finding block size to be jumped
    step = math.sqrt(n)

    # Finding the block where element is
    # present (if it is present)
    prev = 0
    while arr[int(min(step, n)-1)] < x:
        prev = step
        step += math.sqrt(n)
        if prev >= n:
            return -1

    # Doing a linear search for x in
    # block beginning with prev.
    while arr[int(prev)] < x:
        prev += 1

        # If we reached next block or end
        # of array, element is not present.
        if prev == min(step, n):
            return -1

    # If element is found
    if arr[int(prev)] == x:
        return prev

    return -1

# Driver code to test function
arr = [ 0, 1, 1, 2, 3, 5, 8, 13, 21,
    34, 55, 89, 144, 233, 377, 610 ]
x = 55
n = len(arr)

# Find the index of 'x' using Jump Search
index = jumpSearch(arr, x, n)

# Print the index where 'x' is located
print("Number" , x, "is at index" ,"%.0f"%index)
```

##### Interpolation

Interpolation is a technique in Python used to estimate unknown data points between two known data points. Interpolation is mostly used to impute missing values in the dataframe or series while preprocessing data.
https://www.analyticsvidhya.com/blog/2021/06/power-of-interpolation-in-python-to-fill-missing-values/

### Kafka

#### What is Apache Kafka

It is an open source distributed event streaming platform.

### Producers

Producers are those client applications that publish (write) events to Kafka.

### Events

An event records the fact that "something happened" in the world or in your business. It is also called record or message in the documentation. When you read or write data to Kafka, you do this in the form of events. Conceptually, an event has a key, value, timestamp, and optional metadata headers. Here's an example event:

Event key: "Alice"
Event value: "Made a payment of $200 to Bob"
Event timestamp: "Jun. 25, 2020 at 2:06 p.m."

## Topics

Events are organized and durably stored in topics. Very simplified, a topic is similar to a folder in a filesystem, and the events are the files in that folder. An example topic name could be "payments". Topics in Kafka are always multi-producer and multi-subscriber: a topic can have zero, one, or many producers that write events to it, as well as zero, one, or many consumers that subscribe to these events. Events in a topic can be read as often as needed—unlike traditional messaging systems, events are not deleted after consumption. Instead, you define for how long Kafka should retain your events through a per-topic configuration setting, after which old events will be discarded. Kafka's performance is effectively constant with respect to data size, so storing data for a long time is perfectly fine.

### Consumers

Consumers are client applications that subscribe to (read and process) these events from producers using a given topic name. They do not know about the producers.

### Partitions

Topics are partitioned, meaning a topic is spread over a number of "buckets" located on different Kafka brokers. This distributed placement of your data is very important for scalability because it allows client applications to both read and write the data from/to many brokers at the same time. When a new event is published to a topic, it is actually appended to one of the topic's partitions. Events with the same event key (e.g., a customer or vehicle ID) are written to the same partition, and Kafka guarantees that any consumer of a given topic-partition will always read that partition's events in exactly the same order as they were written.

### Replication

To make your data fault-tolerant and highly-available, every topic can be replicated, even across geo-regions or datacenters, so that there are always multiple brokers that have a copy of the data just in case things go wrong, you want to do maintenance on the brokers, and so on. A common production setting is a replication factor of 3, i.e., there will always be three copies of your data. This replication is performed at the level of topic-partitions.

#### Reading data from topic (consumer)

```python
# Import KafkaConsumer from Kafka library
from kafka import KafkaConsumer

# Import sys module
import sys

# Define server with port
bootstrap_servers = ['localhost:9092']

# Define topic name from where the message will recieve
topicName = 'First_Topic'

# Initialize consumer variable
consumer = KafkaConsumer (topicName, group_id ='group1',bootstrap_servers =
   bootstrap_servers)

# Read and print message from consumer
for msg in consumer:
print("Topic Name=%s,Message=%s"%(msg.topic,msg.value))

# Terminate the script
sys.exit()
```

##### Using Json

```python
# Import KafkaConsumer from Kafka library
from kafka import KafkaConsumer

# Import sys module
import sys

# Import json module to serialize data
import json

# Initialize consumer variable and set property for JSON decode
consumer = KafkaConsumer ('JSONtopic',bootstrap_servers = ['localhost:9092'],
value_deserializer=lambda m: json.loads(m.decode('utf-8')))

# Read data from kafka
for message in consumer:
print("Consumer records:\n")
print(message)
print("\nReading from JSON data\n")
print("Name:",message[6]['name'])
print("Email:",message[6]['email'])
# Terminate the script
sys.exit()
```

#### Publishing to topic (Producer)

```python
# Import KafkaProducer from Kafka library
from kafka import KafkaProducer

# Define server with port
bootstrap_servers = ['localhost:9092']

# Define topic name where the message will publish
topicName = 'First_Topic'

# Initialize producer variable
producer = KafkaProducer(bootstrap_servers = bootstrap_servers)

# Publish text in defined topic
producer.send(topicName, b'Hello from kafka...')

# Print message
print("Message Sent")
```

```python
# Import KafkaProducer from Kafka library
from kafka import KafkaProducer

# Import JSON module to serialize data
import json

# Initialize producer variable and set parameter for JSON encode
producer = KafkaProducer(bootstrap_servers =
  ['localhost:9092'],value_serializer=lambda v: json.dumps(v).encode('utf-8'))

# Send data in JSON format
producer.send('JSONtopic', {'name': 'fahmida','email':'fahmida@gmail.com'})

# Print message
print("Message Sent to JSONtopic")
```

# Actual questions asked

I interviewed with a lead data engineer at Ring. This was one of the most pleasant, straight forward interviews I've had. He was kind, patient, curious, and detailed. He mentioned specific details from my resume to ask questions about and overall it was appreciated! With that said, we talked for a while and not many `STAR` questions above were asked. The general technical questions and details from the interview are below.

## Kafka

### What is Kafka from a high level

Kafka is an open source distributed message broker. It operates in a fault tolereant, replicated, resilient manner using topics, partitions, producer and consumer groups. Essentially, you have a client application monitoring lets say a logging stream. You create a producer that tails this log stream and designate a topic and partitions. It publishes these logs, but then you need something to consume it which is where consumer applications come in. You stand those up and designate the topic for it to watch and transform and also subsequently publish if you wish. Consumer and producer groups do not have knowledge of each other.

### If I have 30 brokers, 3 partitions, and 30 consumers what is the blocker and why are only 3 consumers being used?

You only have 3 partitions. In order for the rest of the consumers to be used, you need to increase to at least 30 partitions to match the 1:1 requirement between consumers and partitions.

## Live coding

### Switch vowels in a string

Test case:

```python
def main():
    """
    * Challenge: Swap positions of all vowels in a String from outside in.
    *
    * All characters will be ASCII a-z, lowercase.
    * If a given String has an odd number of characters the middle character, if a vowel,
    * swaps with itself.
    *
    """
    tests()


# TODO: Implement this
def swap_vowels(string):
    return string


def tests():
    assert swap_vowels("") == ""

    assert swap_vowels("z") == "z"
    assert swap_vowels("zz") == "zz"
    assert swap_vowels("zzz") == "zzz"

    assert swap_vowels("azz") == "azz"
    assert swap_vowels("zaz") == "zaz"
    assert swap_vowels("zza") == "zza"

    assert swap_vowels("fao") == "foa"
    assert swap_vowels("foo") == "foo"
    assert swap_vowels("hello") == "holle"


if __name__ == "__main__":
    main()

```

#### My solution

```python

def main():
    """
    * Challenge: Swap positions of all vowels in a String from outside in.
    *
    * All characters will be ASCII a-z, lowercase.
    * If a given String has an odd number of characters the middle character, if a vowel,
    * swaps with itself.
    *
    """
    tests()


# TODO: Implement this
def swap_vowels(string):
    # lowering string and converting to a list
    original_str_list=list(string.lower())
    # Giving criteria
    vowels=["a","e","i","o","u","y"]
    found_vowels_list=[]
    # Looping through each character of string
    for i in original_str_list:
        # comparing char to criteria
        if i in vowels:
            # append to found_vowels_list
            found_vowels_list.append(i)
    for i in range(len(original_str_list)):
        if original_str_list[i] in vowels:
            original_str_list[i] = found_vowels_list[-1]
            found_vowels_list.pop()
    return "".join(original_str_list)


def tests():
    assert swap_vowels("") == ""

    assert swap_vowels("z") == "z"
    assert swap_vowels("zz") == "zz"
    assert swap_vowels("zzz") == "zzz"

    assert swap_vowels("azz") == "azz"
    assert swap_vowels("zaz") == "zaz"
    assert swap_vowels("zza") == "zza"

    assert swap_vowels("fao") == "foa"
    assert swap_vowels("foo") == "foo"
    assert swap_vowels("hello") == "holle"


if __name__ == "__main__":
    main()


```

##### Follow up questions based on my solution

###### Why would string[index] = i a bad practice

Strings are immutable in Python. If you did this, you would get a runtime error.

###### What is the Big O Notation of `if in in vowels`

It would O(n\*n) due to the list needing to perform the operation every time.

###### What is a potential side effect of using the string.replace function?

If there are duplicate vowels being replaced, it would replace all occurences of the vowel and not truly reverse the order of the vowels in the string.

###### What could I do to increase the speed of the search

Switch to a O(n) solution like with a heap(?). This was a guess, but he said I was right!

#### His solution

```python
def main():
    """
    * Challenge: Swap positions of all vowels in a String from outside in.
    *
    * All characters will be ASCII a-z, lowercase.
    * If a given String has an odd number of characters the middle character, if a vowel,
    * swaps with itself.
    *
    """
    tests()


# TODO: Implement this
def swap_vowels(string):
    # only swap vowels
    vowels = ["a", "e", "o", "i", "y"]

    # iterating through string, letter by lettesr
    for i in vowels:
        # checking to see if letter is a vowel
        temp_vowel = "a"
        # fao = foa
        if i in vowels:
            # save vowel
            string.replace(i, temp_vowel)
            # loop through rest of letters and check if other vowels
            temp_vowel = i

    return string

def swap_vowels(string):
    head = 0
    tail = len(string) - 1

    result = [str()] * len(string)

    while head <= tail:

        if not is_vowel(string[head]):
            result[head] = string[head]
            head += 1
            continue

        if not is_vowel(string[tail]):
            result[tail] = string[tail]
            tail -= 1
            continue

        swap = string[head]

        result[head] = string[tail]
        result[tail] = swap

        head += 1
        tail -= 1

    return ''.join(result)


def tests():
    assert swap_vowels("") == ""

    assert swap_vowels("z") == "z"
    assert swap_vowels("zz") == "zz"
    assert swap_vowels("zzz") == "zzz"

    assert swap_vowels("azz") == "azz"
    assert swap_vowels("zaz") == "zaz"
    assert swap_vowels("zza") == "zza"

    assert swap_vowels("fao") == "foa"
    assert swap_vowels("foo") == "foo"
    assert swap_vowels("hello") == "holle"


if __name__ == "__main__":
    main()

```

FIN!
