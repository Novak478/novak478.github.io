---
title: "Spark Introduction Guide"
layout: post
date: 2019-10-05
projects: true
tag:
- tech
- programming
- bigdata
- scala
- spark
- guide
- python
- pyspark
category: project
author: zacknovak
description: An introduction to Apache Spark
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

# Apache Spark Guide

This guide is meant to inform you on Spark, but isn't all inclusive. This content is not exclusively mine either. Some of the context has been paraphrased from other answers / documents online that I thought explained it well. Some may not have a source link and I apologize for that.

# Contents

[What is Apache Spark?](#what-is-apache-spark)

[Why Spark?](#why-spark)

[Components of Spark](#components-of-spark)

[Understanding Actions vs. Transformations in Spark](#understanding-actions-vs-transformations-in-spark)

[Understanding Clusters](#understanding-clusters)

[How a Spark Application Runs on a Cluster](#how-a-spark-application-runs-on-a-cluster)

[Random Questions](#random-qs)

# What is Apache Spark?

- General Description:
  - Apache Spark (Spark) is an open-source distributed general-purpose cluster-computing framework built with Scala.
  - Spark is an execution framework / scheduler more or less and known for it&#39;s data parallelism and fault tolerance, i.e. it&#39;s ability to run tasks across different nodes in sync and handle failure across nodes. It orchestrates the distribution of your data across the cluster and dictates the processing of your data in parallel.
  - Scala uses Java Virtual Machines (JVM), so Java can be used when working with Spark, but Scala is the preferred language as again, that is what it is built with. Spark has API&#39;s for use with Python and R additionally.
- How did Spark come to be?
  - Spark is the next evolution of Apache Hadoop. Apache Hadoop is similar to Spark in that it is another cluster-computing framework but left a lot to be desired; so along came Spark.
- What are the main goals of Spark?
  - **Distribute data:** when a data file is uploaded into the cluster, it is split into chunks, called data blocks, and distributed amongst the data nodes and replicated across the cluster.
  - **Distribute computation** : those data chunks mentioned above can still be pretty computational intense. Spark distributes those computations to speed up the computations.
  - **Tolerate faults** : both data and computation can tolerate failures by failing over to another node for data or processing.

# Why Spark?

  - It is able to be used with a wide amount of data sources including S3, Redshift, HDFS, and others.
  - Hadoop was reliable with how it processed data and fast with reading data from disk, but Spark said why even put in disk? Just put it in memory!
  - Spark is extremely efficient when it comes to running programs in memory. Compared to Hadoop&#39;s MapReduce, Spark is **theoretically** 100x faster in memory and 10x faster on disk. **In reality, it is 2 - 3 times faster than Hadoop**. This is accomplished through Spark&#39;s organizer and lazy evaluations.
    - Lazily evaluation **does not mean it is slow to perform**. It means that it waits until the last possible minute before doing an evaluation to maximize the performance of the operation requested. When executed, it follows a logical plan that may shuffle the order you&#39;ve called your results in to achieve the fastest possible return.
    - What this means is that every instruction you order Spark to perform is defined as either an action or a transformation. Well, none of those orders are performed until you call an action like count()! When you do call an action though, Spark looks at everything you are instructing it to do from the checkpoint beforehand to the action now. It will then determine the quickest way to get from a to b with the desired results.
      - If you have ever taken pre-calculus, you may remember having to prove trigonometric identities. This was possible through as many as 10, 100, 1000, etc. steps.
      - Well in that same sense, think of you programming a proof and when you enter in an action, Spark is proving that proof in the shortest amount of steps possible.
    - To see examples of different actions / transformations, go here: [https://training.databricks.com/visualapi.pdf](https://training.databricks.com/visualapi.pdf)
  - Spark runs multi-threaded tasks inside of JVM processes, whereas Hadoop&#39;s MapReduce runs as heavier weight JVM processes. This gives Spark faster startup, better parallelism, and better CPU utilization.
    - This just means that both Spark and Hadoop MapReduce use JVM, but Spark run&#39;s a version of JVM with less system processes i.e. more memory / CPU to do what you want to do rather than giving it to the JVM to stay alive.
- Why is reading in memory faster than reading from disk?
  - When you&#39;re using disk memory, you&#39;re using quite a bit of input / output operations. Reading into the disk, reading off the disk, reading into, reading off of, etc. until completion. With working in memory, you eliminate the input / output operations associated with disk usage.
    - Think of it like this: You&#39;re working on a project with one hundred steps. If you&#39;re acting like the disk, you need to email your manager after each step to say what that step&#39;s output is. If you&#39;re acting like memory, you just do all one hundred steps and then say &quot;Hey the project is done, here is what I found&quot;.
- What are the dangers of working in memory?
  - When working in memory, nothing is saved permanently unless you command it to write back to disk. You can cache what you are working on to the cluster you are attached to, but if that cluster goes down, you sink with the ship. Again – Spark is fast due to its ability to skip I/O on disk. It&#39;s a double-edged sword in this case.

# Components of Spark

  - **RDD:** Resilient, distributed dataset. It&#39;s a chunk of data, plain and simple.
  - **Partitions** : A partition is a small chunk of an RDD. Spark manages data using partitions that helps parallelize data processing with minimal data shuffle across the executors.
  - **Task** : A task is a unit of work that can be run on a partition of a distributed dataset and gets executed on a single executor. The unit of parallel execution is at the task level. All the tasks with-in a single stage can be executed in parallel
  - **Executor** : An executor is a single JVM process which is launched for an application on a worker node. Executor runs tasks and keeps data in memory or disk storage across them. Each application has its own executors. A single node can run multiple executors and executors for an application can span multiple worker nodes. An executor stays up for the duration of the Spark Application and runs the tasks in multiple threads. The number of executors for a spark application can be specified inside the SparkConf or via the flag –num-executors from command-line.
  - **Cluster Manager** : A service for acquiring resources on the cluster (e.g. **standalone manager** , Mesos, YARN). Spark is agnostic to a cluster manager as long as it can acquire executor processes and those can communicate with each other. We are primarily interested in Yarn as the cluster manager.
  - **Cores** : A core is a basic computation unit of CPU and a CPU may have one or more cores to perform tasks at a given time. The more cores we have, the more work we can do. In spark, this controls the number of parallel tasks an executor can run.

# Understanding Actions vs. Transformations in Spark

- What do you mean by &quot;expensive&quot;?
  - In Spark and more generally in distributed computing, sending data over the network (shuffling in Spark) is the most **expensive** action as it involves disk input/output (I/O), data serialization, and network I/O.
  - Spark operates best when you avoid disk and network I/O. So, when you do actions like join or groupBy, you are calling an action that requires a shuffle and increases the stages needed for the job.
  - Think of a job in terms of time. **A job that takes longer than another one is more expensive than the other.**
- What is a shuffle in spark?
  - A shuffle is simply the nodes communicating with each because they need to in order to complete an action.
  - The following actions are examples of shuffle inducing operations for RDDs:
    - groupBy/subtractByKey/foldByKey/aggregateByKey/reduceByKey
    - cogroup
    - any of the join transformations
    - distinct
  - Those operations above all depend on multiple rows. It that case, the node must assume it knows nothing about the contents of a partition and must looks across all partitions of an RDD to match up rows.
  - Extra resource on shuffles: [http://hydronitrogen.com/apache-spark-shuffles-explained-in-depth.html](http://hydronitrogen.com/apache-spark-shuffles-explained-in-depth.html)

# Understanding Clusters

- What is a cluster?
  - In our case, a cluster is a group of connected virtual servers.
    - A virtual server is just a slice of an actual server. A virtual server is designed to mimic an actual server, but with the flexibility to allow for separate Operating Systems, software, and provisioning.

- Spark – driver and workers:

  - What is a driver?
    - The spark driver is a JVM that host&#39;s the SparkContext for a Spark Application.
    - It provides a web UI for us to monitor the cluster.
    - It hosts the standalone spark cluster manager that we use.
    - It controls the jobs themselves and the task&#39;s executions across the cluster.
      - When an action is called, the optimizer is run within the driver and the optimal number of stages are created first and then tasks. The driver then sends the list of tasks it wants done to the cluster manager, who then schedules and designates the tasks to each executor.
    - The driver&#39;s daemon is created when a job is first run on the cluster as well. It:
      - Handles application execution.
      - Communicates with standalone spark cluster manager which negotiates resources with the executors.
      - work with the NodeManager(s) to execute and monitor the tasks.
  - What is a worker?
    - Worker nodes run spark instances and host the actual executors that complete the tasks given to them by the driver node.
    - A worker receives serialized tasks that it runs in a threat pool, or a queue of tasks.
    - It Is important to note that each executor hosts a local Block Manager that communicates to other workers in a cluster and trades blocks accordingly. When data is shuffled, the workers manage all communicate without the driver node.

- General Cluster Stuff with an example.
  - For this example, I am working with one (1) driver node with the size r4.xlarge and three (3) workers nodes also r4.xlarge.
    - The r4.xlarge ec2 instances are in-memory processing optimized, meaning they are pretty much made for Spark.
      - AWS&#39;s description: In-memory processing is a huge deal. With workloads growing larger by the day and CPUs gaining power with every successive generation, the ability to fit entire datasets into memory is becoming a prerequisite for high-quality Business Intelligence, analytics, data mining, and other real-time workloads that are sensitive to latency. Distributed caching and batch processing workloads can also benefit from fast access to lots of memory. ([AWS Memory Optimized](https://aws.amazon.com/blogs/aws/new-next-generation-r4-memory-optimized-ec2-instances/))

![](RackMultipart20210226-4-1suxqdq_html_28b3926d9c517d7.png)

  - When working with Spark, you generally only want to work with memory optimized ec2 instances.

      - So, r4.xlarge nodes have the following specifications:
        - 5 GB memory, 4 cores, and 1 DBU.
      - So then, between all four nodes we hypothetically have:
        - 122 GB of memory, 16 cores, and 4 DBUs.
      - Unfortunately, that is incorrect though! In reality, we only have:
        - ~81 GB of memory to use, 12 cores, and 3 DBUS.

- Bit weird eh? We lose memory and cores due to a few reasons listed below:
  - Core loss:
    - You lose 1 core to the cluster&#39;s operating system.
      - The cluster needs an operating system to operate so this is pretty self-explanatory.
    - You lose 1 more core to Cluster Manager.
      - We use spark&#39;s standalone cluster manager is the cluster manager mentioned above in the driver section as well as the components of spark section.
    - You lose yet 1 more due to the Hadoop Daemon.
      - Hadoop Daemon allows us to use the transformations / actions native to Spark/Hadoop.
  - Memory loss:
    - Just due to the memory overhead of running the cluster and it&#39;s native processes, we lose around ~30 – 35 % of memory.

# How a Spark Application Runs on a Cluster

- The Spark driver is launched to invoke the main method of the Spark application.
- The driver asks the cluster manager for resources to run the application, i.e. to launch executors that run tasks.
- The cluster manager launches executors.
- The driver runs the Spark application and sends tasks to the executors.
- Executors run the tasks and save the results.
- Right after SparkContext.stop() is executed from the driver or the main method has exited all the executors are terminated and the cluster resources are released by the cluster manager.

# Random Q&#39;s

- Finding your driver node.
  - This one is straight forward.
  - Go to your Cluster in Databricks.
  - Click on the final tab &quot;Spark Cluster UI – Master&quot;
  - Look for the address at the end of &quot;Spark Master at spark://10.75.244.80:7077&quot;.
    - The ip address listed is your driver node.
- What type of data does Spark work best with?
  - Distributed data. 4 files of 50mb each is easier to handle than 4 files with 2 at 75mb and 2 at 25mb. Remember that Spark is all about parallelism, so having as equally distributed data as possible makes it happy.
- What is Databricks?
  - Databricks is a web-based platform for working with Spark, that provides automated cluster management, connection to online repositories like S3 / Azure, and IPython-style notebooks. It makes it very easy to work with Spark. It is the bomb diggity. It&#39;s private and still technically a startup but you better believe I am trying to buy stock.
- Understanding Garbage Collection Logs
  - There is really no simple way to understand GC logs. I&#39;ve tried. Please read the below link.
  - [https://plumbr.io/blog/garbage-collection/understanding-garbage-collection-logs](https://plumbr.io/blog/garbage-collection/understanding-garbage-collection-logs)
