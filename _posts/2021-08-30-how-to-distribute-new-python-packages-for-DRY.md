---
title: "How to distribute new python packages"
layout: post
date: 2021-08-30
projects: true
tag:
- tech
- python
- distribution
- github
- cicd
category: project
author: zacknovak
description: How to distribute python packages, locally and through Git CICD
---


# Overview

If you've never built a python package for distribution before, it can be confusing. This will go over how to built the package manually and also how to automate it using GitHub Actions.


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

# How to build the package and distribute it

## Manually

1. Make sure you have the distribution package `twine` installed. You can install it using the command `pip install twine`. The read the docs link is here as well: https://twine.readthedocs.io/en/stable/
2. You'll have to configure twine next using your PyPI repository details using environment variables. You can also use flags in your later upload command that will pass on along username, password, and url configurations, but I recommend against this unless you have different users / urls. *Make sure to reload your shell after the change!*
  - In your shell configuration like `.zshrc`, set the following environment variables:
  - ```bash
    export TWINE_USERNAME=USERNAME
    export TWINE_PASSWORD=PASSWORD
    export TWINE_REPOSITORY=REPO_URL
    ```
3. Navigate to your main project directory (the same level as `setup.py`).
4. Run `python3 setup.py sdist bdist_wheel`. This will build the initial distribution package using the `setup.py` in the directory. It will build a distribution folder and a `.whl` file using the wheel format, which is the standard for Python. In this example, we are also uploading the entire the distribution package for ease. The `.whl` file is essentially a ZIP ( . zip ) archive with a specially crafted filename that tells installers what Python versions and platforms the wheel will support. This is useful for any potential conflicts in the future between packages.
5. Next, you can upload the actual distribution to your PyPI repository with the command `twine upload --skip-existing --verbose dist/*.whl`. This will upload the distribution AS LONG AS the package version created does not already exist. I HIGHLY recommend using the `--skip-existing` flag as it will help with versioning and actually bumping the version.
6. It should have been uploaded now! You can download it from your repository with `pip install` as long as you have configured your pip installer to reference your PyPI directory. To do that, you'll need to add a line to your `pip.conf` at the location: `vim /Users/<you>/.config/pip/pip.conf` and add the following line:
```python
[global]
extra-index-url = https://<TWINE_USERNAME>:<TWINE_PASSWORD>@<REPO_URL>/simple/
```

## Git CI to get the package distributed as a PR

1. In your repo, create `.github` folder in the main directory.
2. Create a folder within `.github` called `workflows`.
3. Confirm your path is now `.github/workflows/` in your desired project.
4. Add the following file. This will enable the workflow to run when merging to your `main` branch. You will need to change it if your branch is named `master` or vice versa.
```yaml
name: Build and Push Workflow (Push)

on:
  push:
    branches:
      - main

jobs:
  build_push_package:
    name: Build and Push Package
    runs-on: ubuntu-20.04
    steps:
      - uses: actions/checkout@v2
      
      - name: Install build package
        run: python3 -m pip install --upgrade build
      
      - name: Install twine package
        run: python3 -m pip install --upgrade twine

      - name: Build the Python package
        run: python3 setup.py sdist bdist_wheel
      
      - name: Upload Package
        env:
          TWINE_USERNAME: ${{ secrets.USERNAME_PYPI }}
          TWINE_PASSWORD: ${{ secrets.PASSWORD_PYPI }}
          TWINE_REPOSITORY_URL: ${{ secrets.PYPI_REPO_URL }}
        run: twine upload --skip-existing --verbose dist/*.whl
```
5. Now notice that this is pretty similar to the manual process, but we use GitHub Secrets. You'll need to add those to your repository by going to your repo in GitHub -> Settings -> Secrets -> Actions. Add the secrets referenced of `USERNAME_PYPI`, `PASSWORD_PYPI`, and `PYPI_REPO_URL` and you're all set. Now, whenever you merge to main, a new version of your package will be distributed automatically for you!