---
title: "How to pass arguments to Python argparse within Docker container"
layout: post
date: 2021-12-05
projects: true
tag:

category: project
author: zacknovak
description:
---

This post covers how to pass arguments to a Python script's argparse inside of a Docker container.

# Overview

Docker is the way to go. It's awesome. At my job, we use it for our dev process and for production. However, when we originally developing the dev lifecycle, we struggled with how to use everything together. This post covers how to do it all and is an extension of the stack overflow post that the solution originally came up from https://stackoverflow.com/questions/46245844/pass-arguments-to-python-argparse-within-docker-container.

So anywho, let's say you have a python script called `main.py` that expects certain runtime arguements like:

```python
import argparse
import datetime as dt

def main(date_to_run: str):
    print(date_to_run)


if __name__ == "__main__":
    date_to_run = dt.datetime.now().strftime("%Y%m%d")
    parser = argparse.ArgumentParser(
        description="Pass the date you would like to process. The default is the current date."
    )
    parser.add_argument(
        "-d",
        "--date",
        default=dt.datetime.now().strftime("%Y%m%d"),
        help="date to run, YYYYMMDD format",
    )

    args = parser.parse_args()
    if args.date not in [date_to_run, "default"]:
        date_to_run = args.date

    main(date_to_run)
```

Alright tight! So now, you could normally call this script with `python main.py --date 20211205`. That works. So now lets build it as an image and try to run it then.

```Dockerfile
# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8-slim-buster

ENV PACKAGE_NAME=blogtest

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

ENV PYTHONPATH "${PYTHONPATH}:/home/app/src"

RUN mkdir -p /home/app/src/${PACKAGE_NAME} && chmod 775 /home/app

COPY setup.py /home/app/
RUN cd /home/app && python -m pip install .
COPY src /home/app/src
COPY .env /home/app/

WORKDIR /home/app/src/${PACKAGE_NAME}
ENTRYPOINT [ "python", "./main.py" ]
```

Build the image with `docker build -t blogtest` and then to run the image while still passing in python command line arguments for arg parse, do it like so!

```shell
docker run -it --rm --name blogtest-container blogtest --date=20211205
```

Hope this helps. I really like images and you should too.
