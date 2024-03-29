---
title: "The anatomy of setup.py"
layout: post
date: 2022-04-15
projects: true
tag:
    - tech
    - programming
    - bigdata
    - scala
category: project
author: zacknovak
description: Explaining what a setup.py is
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

# Overview

In case you've never seen a `setup.py` before, it is what is used to specify the requirements for a python package before distribution and use in other packages / projects. I've got the different requirements array broken down into `reqs`, `tests_pkgs`, and `develop_pkgs`. It's helpful to break them apart to avoid a few different problems such as:

1. Package size getting bloated. You don't need all packages purely to run the package elsewhere! This is extremely helpful when deploying to environments that have size constraints like AWS Lambda.
2. Dependency conflicts! Your package may require version x of an import, but if one of your dependencies also uses a different version of that package, then uh oh!

-   `reqs` is the core requirements needed ex: `loguru`.
-   `tests_pkgs` is the requirements needed to test the package ex: `pytest`.
-   `develop_pkgs` is the packages needed in use while developing the package ex: `jupyterlab`.

## Example setup.py

```python
from setuptools import setup

reqs = [
    "loguru>=0.6.0",
]

test_pkgs = ["pytest"]
develop_pkgs = ["jupyterlab"]

setup(
    name="your_pkg_name",
    packages=["your_pkg_name"],
    package_dir={"": "src"},
    version="0.0.1",
    python_requires=">3.7",
    description="Python package for whatever.",
    url="https://github.com/your_repo",
    install_requires=reqs,
    extras_require={"develop": develop_pkgs, "test": test_pkgs},
    include_package_data=True,
)
```
