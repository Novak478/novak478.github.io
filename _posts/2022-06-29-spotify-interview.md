---
title: "Spotify interview: post mortem"
layout: post
date: 2022-06-29
projects: true
tag:
    - interviewing
    - spotify
category: blog
author: zacknovak
description: I interviewed with Spotify as a Data Engineer. Here is what the spotify team asked and my answers (or in some cases, "I don't know that" lol)
---

# Overview

I applied to Spotify because I admire their products and culture. I wanted to learn more. I knew it would be a challenging interview due to the format of pretty much getting everything out of the way in an hour and 45 minutes minutes. Here's what the interview was like!

# Their interview process

1. Introductions
2. Programming / domain questions
3. Pair programming a general question
4. Pair programming domain questions

# Questions

## What is the time complexity for a sort like bubble sort?

### My answer

I do not know.

### Answer

The time complexity is `O(n²)` in the average and worst cases. In the best cases, `O(n)`.

Source: https://www.happycoders.eu/algorithms/bubble-sort

## How does map reduce work?

### My answer

I flubbed this one. I answered I do not know.

### Answer

MapReduce facilitates concurrent processing by splitting data into smaller chunks, and processing them in parallel on Hadoop commodity servers. In the end, it aggregates all the data from multiple servers to return a consolidated output back to the application.

Source: https://www.talend.com/resources/what-is-mapreduce/

## What is columnar storage vs row based storage?

### My answer

### Answer

Column oriented databases are databases that organize data by field, keeping all of the data associated with a field next to each other in memory. Columnar databases have grown in popularity and provide performance advantages to querying data. They are optimized for reading and computing on columns efficiently.

In a row store, or row oriented database, the data is stored row by row, such that the first column of a row will be next to the last column of the previous row.

## Can you give an example of columnar storage?

### My answer

Apache HIVE. **Note**: This is technically incorrect.

### Answer

-   Redshift
-   Snowflake

## When might columnar be better than row based storage or vice versa?

### My answer

### Answer

If the data you need to access is stored mostly in a small number of columns and it is not necessary to query each field in the rows, you may be better off with a columnar-store. On the other hand, if you need many columns in each row to determine which rows are relevant, a row-store may be a better fit.

Source: https://medium.com/bluecore-engineering/deciding-between-row-and-columnar-stores-why-we-chose-both-3a675dab4087

## What is functional vs imperative programming?

### My answer

Functional programming is one where the output changes only on the arguments passed to it due to how it is written. One example of this is Scala.

Imperiative programming is where the programmer describes step by step how the program will alter the input and reach the desired end state. Compiled languages like Python are usually imperative since they generate executables.

### Answer

Functional langauges empazies on expressions and declarations rather than execution of statements. Therefore, unlike other procedures which depend on a local or global state, value output in FP depends only on the arguments passed to the function.

Imperative programming is a paradigm of computer programming where the program describes steps that change the state of the computer. Unlike declarative programming, which describes "what" a program should accomplish, imperative programming explicitly tells the computer "how" to accomplish it. Programs written this way often compile to binary executables that run more efficiently since all CPU instructions are themselves imperative statements.

Sources:

-   https://www.guru99.com/functional-programming-tutorial.html
-   https://www.computerhope.com/jargon/i/imp-programming.htm

## What is eventual consistency [in databases]?

### My answer

Can you guess this one? It was "I do not know." haha.

### Answer

Eventual Consistency is a guarantee that when an update is made in a distributed database, that update will eventually be reflected in all nodes that store the data, resulting in the same response every time the data is queried.

Source: https://www.scylladb.com/glossary/eventual-consistency/

## Difference between a thread and a process?

### My answer

I put this in the reference of a python script.

When you run a python script, a python process is started. By default, python is single threaded and locked to a single thread. A thread is part of the process and can be increased like within Python and make the process multithreaded. It is a one-to-many relationship.

### Answer

The best answer for this that I found is from stackoverflow referenced here: https://stackoverflow.com/questions/200469/what-is-the-difference-between-a-process-and-a-thread

**Process**
Each process provides the resources needed to execute a program. A process has a virtual address space, executable code, open handles to system objects, a security context, a unique process identifier, environment variables, a priority class, minimum and maximum working set sizes, and at least one thread of execution. Each process is started with a single thread, often called the primary thread, but can create additional threads from any of its threads.

**Thread**
A thread is an entity within a process that can be scheduled for execution. All threads of a process share its virtual address space and system resources. In addition, each thread maintains exception handlers, a scheduling priority, thread local storage, a unique thread identifier, and a set of structures the system will use to save the thread context until it is scheduled. The thread context includes the thread's set of machine registers, the kernel stack, a thread environment block, and a user stack in the address space of the thread's process. Threads can also have their own security context, which can be used for impersonating clients.

## What is a red black tree in Python and can you give an example?

### My answer

No I cannot, I do not know what that is.

### Answer

Red-Black tree is a self-balancing binary search tree in which each node contains an extra bit for denoting the color of the node, either red or black.

A red-black tree satisfies the following properties:

Red/Black Property: Every node is colored, either red or black.
Root Property: The root is black.
Leaf Property: Every leaf (NIL) is black.
Red Property: If a red node has children then, the children are always black.
Depth Property: For each node, any simple path from this node to any of its descendant leaf has the same black-depth (the number of black nodes).

Source: https://www.programiz.com/dsa/red-black-tree

## What is the difference between an inner and outer join?

### My answer

The different joins are based on the conditions given in the join statements. An inner join is when the conditions match while outer is for those that do not match. Left and right outer joins alter the output.

### Answer

The major difference between inner and outer joins is that inner joins result in the intersection of two tables, whereas outer joins result in the union of two tables.

Source: https://www.freecodecamp.org/news/sql-join-types-inner-join-vs-outer-join-example/

## How can you reduce collisions in a hashmap?

### My answer

I do not know.

### Answer

Not super simple to condense. Read through the below:

Source: https://www.baeldung.com/java-hashmap-advanced

There's also:

You can put a linked list against a hash value and keep on appending all the keys that produce same hash to the linked list. It works because the probability of collision is very less in a good hash map implementation that has a good hash function.

## What is Garbage collection?

### My answer

Garbage collection is the process by which virtual managers like the JVM perform memory management for unused objects.

### Answer

Garbage collection is the process by which programs perform automatic memory management.

## What is Garbage collection used for?

### My answer

Deleting unused objects to free up space for the program to continue.

### Answer

The garbage collector finds unused objects and deletes them to free up memory.

## When can garbage collection be a problem?

### My answer

It can be a problem when you are trying to read in an object but you've done so in a way that creates a memory leak.

### Answer

Excessive garbage collection activity can occur due to a memory leak in the Java application. Insufficient memory allocation to the JVM can also result in increased garbage collection activity. And when excessive garbage collection activity happens, it often manifests as increased CPU usage of the JVM!

Source: https://www.eginnovations.com/blog/what-is-garbage-collection-java/

## What is CAP theorem?

### My answer

Flubbed this one again. I knew it before, but couldn't recall it. I answered I do not know.

### Answer

In theoretical computer science, the CAP theorem, also named Brewer's theorem after computer scientist Eric Brewer, states that any distributed data store can only provide two of the following three guarantees:

**Consistency**
Every read receives the most recent write or an error.
**Availability**
Every request receives a (non-error) response, without the guarantee that it contains the most recent write.
**Partition tolerance**
The system continues to operate despite an arbitrary number of messages being dropped (or delayed) by the network between nodes.

Source: https://en.wikipedia.org/wiki/CAP_theorem

# Pair programming

## Reverse a string in python

### What I did

```python
def reverse_str(s: str):
    reversed = []
    for i in range(len(s), -1, -1):
        reversed.append(i, s[i])
    final = "".join(reversed)
    print(final)

example = "spotify"
reverse_str(example)
```

### Easiest solution

```python
txt = "Hello World"[::-1]
print(txt)
```

Source: https://www.w3schools.com/python/python_howto_reverse_string.asp

## Big data aggregation

We were time constrained so this was just talking through the exercise as compared to actually programming it.

Imagine we have TBs of data in the format `[user_id, track_id, timestamp]`.

### Get metrics

1. Normalize the data. I confirmed we do not care about the columns `user_id` or `timestamp` currently, so I would drop those columns. The data would solely consist of `track_id` then.
2. Since no more prep is needed, I would then aggregate. I would group by track id and do a count. I would then order the count from max to min so that the top tracks appear at the top.

### Get metrics per user

1. We now care about `user_id`, so I would still drop the `timestamp` column. The data would then be `user_id`, and `track_id`.
2. Like before, no more prep is needed so I would now aggregate. I would group by `user_id`, and `track_id`. I can then count like before and order the count from max to min so that the top tracks appear at the top per user.

### Get metrics per user with data needing to be partitioned

I put this in the context of Spotify wrapped haha. So, the data is too large to aggregate / work with in it's current state and you cannot simply increase the size of the nodes / cluster you're on. You then must partition it. So here's how I approached it:

1. We take the data and from the timestamp column, we create three more columns: `year`, `month`, and `day`.
2. We then ingest the data and partition it by the year/month/day columns to a data store like s3.
3. We would then iterate over the data, day by day, and do the aggregates above. We would write this output data out to a different location.
4. Once done, we can re-read in the output data and do the total aggregations for a given date.

# What I plan on doing now

I plan on reviewing the materials more, trying out problems on Leetcode, and also booking a practice interview with [interviewing.io](https://interviewing.io) to try my hand at pair programming interviews again.

Thanks for reading if you got this far!
