---
title: "Reflection after 1 year and some months at a startup"
layout: post
date: 2022-05-30
projects: true
tag:
    - startup
    - tech
category: blog
author: zacknovak
description: Thoughts after a year at a startup. General ideas.
---

# Overview

I've now been at Second Front for over a year now. In that year, I've been around for the creation and now dissolution of the data team after layoffs and product refocusing. Here's some thoughts about it.

## Is your work creating value

You've probably heard of the 80/20 rule in tech (based on the Pareto principle). 20% of an issue takes up 80% of your time. That always holds true because typically there's one bullet point in the acceptance criteria that's thorny. Usually it's testing coverage / communication with a separate team's service / etc.

However, what I mean here is look at the actual issue itself, not the acceptance criteria. Is the issue itself creating value and necessary? This is not always an easy question or topic to bring up, but it's extremely worth while.

As an example, we at 2F had a client request certain infrastructure built out in our data environment. This was simple to do via the console. However, we assumed that this would be used for many other clients and unable to scale via console so we deemed it necessary to automate. We then built out cards to create scripts using Terraform and Boto3 calls to create this infrastructure programmatically. At the end of the day, we haven't ran that infrastructure once programmatically.

The lesson here is not to assume things. If there isn't a strong demand signal or leadership pushing hard for a feature, don't build it. You should comfortable defending your time. On that note...

## I would've been more defensive and selective with my time

It's OK to be open with your time when you first join to get the lay of the land and meet your coworkers. It's also ALWAYS alright to be open to talking to your coworkers. What I mean when I say be more defensive with time is with meetings.

In the first 6 months, there were many meetings I attended where I didn't say a word and/or didn't find the situation applicable to me. Being in those meetings is helpful for context, but at the end of the day, really didn't help me or my coworkers. My rules became the following:

-   If I was in a meeting where I didn't speak at all and without helpful context, I'd stop attending.
-   If I was in a meeting where I didn't speak at all but with helpful context, I'd ask if the meeting recorder had follow up notes provided anywhere. If they did, I'd stop coming to the meetings and instead just read the follow ups. 60 minutes then typically was condensed to 3 - 5 minutes of reading.
-   If I was in a meeting with a few agenda items, I'd try to answer those agenda items before the meeting with the meeting owner. 90% of the time, that slack message answered their questions and saved everyone time. If it didn't the meeting became shorter and more direct because now the true questions were shown.

It's also worth noting that 2F has a friendly culture to the above rules. Nobody is upset if you don't find a meeting beneficial and actually encourage challenging if you're needed. You may need to alter and argue for the rules above in a different cultural mindset, but that's a whole different story.

## Trust your coworkers, but verify what they are saying

This is espescially true if you are basing decisions on what they state, which you most likely are if you are asking.

Just like the game of telephone where a story changes when it goes from person to person, figures, supposed facts, and reasons change based on who they see / hear it from.

Like the point above where you should "is this creating value", you should also be able to verify facts and figures driving the value creation.

## Reduce duplication of work whenever possible

It's unlikely that you'll duplicate work across the team you are on if you're following a work process like scrum or kanban. This issue is about cross team duplication and setting scope boundaries.

Without scope boundaries, you'll likely duplicate work because with potentially serious tech debt due to the different build styles and thus the separate one-off patching / maintenance needed. Also, this can lead to confusion among support staff / business with who to reach out to for client work. This can lead to frustration among development, bad customer support, and overall

Without cross team communication and project manager / tech lead guidance, you'll also likely duplicate solutions to the same problem. This isn't a huge problem at first because there are many different ways to solve a problem and everything is working to their specific use case, but like above, this can lead to serious tech debt.

This is where a strong project manager and team lead is immensely valuable. They'll be able to set the boundaries for a team and dictate who should do what. At the very least, senior engineers / tech leads should be meeting to discuss work projects every sprint to see if others had already worked on similar solutions. Keep the context light at first, but discuss the general idea of a project. If someone bites on the general idea, theres a chance it's duplicate work.
