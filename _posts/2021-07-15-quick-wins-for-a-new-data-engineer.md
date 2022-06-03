---
title: "Quick wins for a new data engineer"
layout: post
date: 2021-07-15
projects: true
tag:
    - startup
    - tech
category: project
author: zacknovak
description: Potential quick wins as a new data engineer hire
---

# Overview

Some quick wins you can do as a data engineer and get off to a good start.

## Be open to change and putting out fires

This is the easiest one, and one that'll leave a great first impression in terms of your work. If you're like me, you're goofy. It's easy for someone to get an impression of you when you first meet, but your work and work ethic speaks for itself. Those impressions make a much bigger impact on my mind than the first time you introduce yourself to someone in a meeting.

In that sense, be open to change. You may have done things at certain companies before, but every company is different. Be flexible to new processes. Still offer your input if you think a new to you process is wrong, but try to understand why it is like that at first before offering your opinion. This will make you much more prepared if you do try to argue your case and also offer insight that will be appreciated.

Second is to offer yourself for whatever work is available at first. Gain exposure to the code base and to your fellow coworkers. See if there are any projects that others are burnt out on that you can lend fresh hands and eyes to as you may notice a solution not seen by others that can solve the problem.

## Create a cloud data storage strategy

Look at where existing data is being written to. Is it it a manner that's easily understood in terms of hierarchy? Is there duplicate data? Is data being separated by date / product for easy ingestion and scaling? Are you collecting raw / normalized / and derived data separately for backfilling / audits? These are all things to consider.

Also confirm that all S3 buckets are private, and PII is AES256 encrpyted server side. No S3 buckets should be public by default.

Another win, but slightly less quick, is to restructure existing data in use to the new format and backfill.

## Add unit testing to existing data pipelines

This will get you familiar with the current code and seeing what the actual code base looks like. Run a code coverage report using the python package `coverage` and see how much of production packages are actually covered.

## Assess the current data pipelines using a SWOT (Strength, Weakness, Opportunities, Threats) analysis

Ties in with above. See where the bottle necks are. Check the documentation (if there is any) and see what's missing / out of context. This may be internal only to you, but it can be beneficial for proposing future work and getting a better picture as to the state of your team.

## Standardize a new member setup script

If this hasn't been done before, record your onboarding process and what you needed to do to get your machine ready for development work. This will aid future new hires and also help with standardizing the tool in terms of tooling which is immensely helpful for debugging.
