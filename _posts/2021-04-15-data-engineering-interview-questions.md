---
title: "Question to ask during a data engineering interview"
layout: post
date: 2021-04-15
tag:
    - tech
    - hiring
    - interviewing
category: project
author: zacknovak
description:
---

Some sample data engineering questions to ask.

# Overview

I've been a data engineer for 3+ years now. Here are some questions you can ask to get the ball rolling for follow up questions.

## Sample questions

-   How did you end up on your current ETL platform?
    -   This can lead the way to questions around team technical ability as well as leadership. It can also reveal any regulations affecting future decision making.
    -   For example, if the ETL platform is Astronomer (a hosted version of Airflow), then you can follow up and ask why did they opt for a hosted solution instead of roll your own / etc.
-   What made you think you need a data engineer? What are you currently doing with data engineering?
    -   WHAT YOU WANT TO HEAR: We are using data for x y z products and to support a b and c. We are growing and need additional data engineers for q and p etc.
    -   WHAT YOU DONT WANT TO HEAR: Exploratory. We have a garbage dump of data and we want someone to find gold in it. **Hint: You probably won’t.**.
-   What work methodology do you currently follow?
    -   Agile: In case you're not familiar with it, this is where you have grooming, pointing, sprints, and sprint retros. This is the more typical software engineering methodoloy being used by companies. It is rigorious and requires a lot of admin overhead to do effectively.
    -   Kanban: This is my preferred methodology for data engineering. Data engineering typically is half putting out fires and half value adding project work. Due to that, it's hard to function in a traditional scrum manner where you're dedicated only to the work.
    -   Nothing wrong with agile either. This can open up more follow up questions about sprint ceremonies though and get you a more detailed day to day / week to week work description.
-   What do you use currently for testing?
    -   This can be unit testing, integration testing, pipeline testing, etc.
    -   Examples include Great Expectations for pipeline ETL testing, pytest for unit testing, terraform + pytest for integration, etc.
    -   This opens up questions on code coverage expectations and development expectations.
