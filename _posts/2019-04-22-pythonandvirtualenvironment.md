---
title: "How to setup python 2.7 and 3.7 with a virtual environment"
layout: post
date: 2019-04-22 20:00
projects: true
tag:
- programming
- tech
- python
- virtualenvironments
- guide
category: post
author: zacknovak
description: How to set up Python 2.7 and 3.7 and use virtual environments
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

# How to set up python 2.7 and 3.7 on a Windows machine and use virtual machines.
* This guide is meant to show users how to download python and use virtual environments on Windows machines. It will also show users how to use virtual environments in Eclipse using PyDev and in Visual Studio Code. These same principles can be applied to PyCharm as well.

## Prerequisites
Installations you need to have ahead of time:

* Visual Studio Code (should already be installed but if not link is [VS Code link](https://code.visualstudio.com/download).
* Eclipse (Windows 10 64 bit -- [Java EE IDE](https://www.eclipse.org/downloads/packages/)).

## Instructions
### 1. Downloading Python
* Go to your C drive (C:\)
* Create a folder “opt” – C:\opt\
* Go to [Python 2.7.16](https://www.python.org/downloads/release/python-2716/). Download the .msi to your default downloads folder. 
* Go to [Python 3.7](https://www.python.org/downloads/release/python-370/) and grab the appropriate windows exe. Download to your default downloads folder. Note the description based on your computer.
* Run 2.7.16.exe first
* Make sure you are downloading to C:\opt\Python27
* When you go to this screen: ![python27 install](assets/images/python27install.png) make sure you check the option add python.exe to path and pip option.
* Finish downloading 2.7.
* After the installation is complete double check to make sure you see python in your PATH! You can find your path by opening your control panel -> System and Security -> System -> Advanced System Settings -> Environment Variables -> Selecting Path -> Edit ->
* Now you’re looking at your Path. Be Careful! If you delete or add to the path accidentally you may break other programs.
* You need to confirm that C:\opt\Python27; and C:\opt\Python27\Scripts; is part of your path.
* OK so Python 2.7 is installed. Now onto 3.7
* Run python-3.7.exe as an administrator.
* Select custom install.
* Make the custom installation location: C:\opt\Python37
* Select "Add python.exe to the path."
* Finish installation.
* OK now so both Python 2.7 and 3.7 are downloaded.
### 2. Installing virtualenv and virtualenvwrapper-win
* Open a cmd prompt.
* Type ‘python’. Python 2.7 should appear as it was the first one added to your path. If it doesn’t, it’s not correctly installed on your PATH.
* Enter "exit" to exit out of the python terminal.
* Enter `pip install virtualenv`
* Wait until that is finished successfully. This is installing the virtual environment module.
* Now enter `pip install virtualenvwrapper-win`.
* Also wait until that is done downloading.
### 3. Making two different virtual environments
* We are now going to create two separate virtual environments; one with Python 2.7, the other with Python 3.7.
* In your cmd prompt, enter: 
```powershell
mkvirtualenv python27example -p=C:\opt\python27\python.exe
```
This is saying essentially make a new virtual environment named python27example using the Python 2.7 as it’s interpreter.
* Wait for that to download – it may take a minute or two. 
* Environments are created at the following path: C:\Users\<user>\Envs
* This will create a folder with python2.7’s exe in it, pip, and setup tools as well as activate that virtual environment (shown by (python27example) to the left of your cmd prompt).
* In your cmd prompt, now enter `deactivate python27example`.
* You are now no longer using the python2.7 virtual environment.
* Now enter in your cmd prompt:
```powershell
mkvirtualenv python37example -p=C:\opt\python37\python.exe
```
When that is all done, don’t deactivate!
* Create your dev folder
```powershell
cd C:\Users\<your name>
mkdir dev
cd dev
mkdir 37example
cd 37example
```
Confirm you are now in `C:\Users\<your name>\dev\37example`
* Time to set this virtual environment’s project directory (it’s home base).
* Enter
```powershell
#Make sure you are in the project 37example C:\Users\<user>\dev\37example
setprojectdir .
```
This is now the home for the virtual environment. The next time you activate the env, it will go here.
* Ok so lets just download some packages to introduce you to pip if you're not familiar with it.
* Enter in your command line `pip install pandas`
* This will now download the pandas package to python37example – you can confirm this by going to the virtual environment’s env folder and seeing it in the site-packages folder.
### 4. Visual Studio Code
* Open Visual Studio Code
* Open the folder ` C:\Users\<your name>\dev\37example`
* Next, click on the cog wheel in the bottom left hand of VS Code. In the resulting pop up, press “Extensions”.
* Search and install the following:
    * Python
        *   So this may seem confusing, but this doesn’t actually run the file like you might think – this is just a linting/debugging/intellisense/refactoring tool. Very helpful in actually writing code.
    * Code Runner
        * Allows you to highlight and run just sections of code (like a notebook – helpful testing just sections instead of a whole file).
* Next right click in your directory and click “New File’. Name it helloworld.py. 
* In this file, enter 
```python
import pandas
print("hello world")
```
* Click on the blue/black bar under the cog wheel that you clicked on for your extensions, and click your virtual environment `Python 3.7.32 (‘python37example’: virtualenv)`
* Close and re-open VS Code.
* Run the file by pressing “Run Code” in the top right of VS Code. You'll see "hello world" in the output. You should be golden ponyboy. 
* Close VS Code.
* Go back to your cmd prompt and enter `deactivate python37example`
### 5. Eclipse
* Back to 2.7. Enter `activate python27example` in your cmd prompt.
* Follow instructions below:
``` powershell
cd C:\Users\<you>\dev`
mkdir 27example
cd 27example
```
* Confirm you are now in `C:\Users\<your name>\dev\27example`
* Enter `setprojectdir .`
* Lets introduce you to requirements.txt functions.
* Go to `C:\Users\<your name>\dev\27example` and create a text file called `requirements.txt`.
* In this text file, add: 
    * Flask
    * requests
    * numpy
    * Fabric
    * Flask-SQLAlchemy
    * Flask-WTF
    * WTForms
    * coverage`
* Save.
* OK so in your cmd prompt, enter: `pip install -r requirements.txt`
* This will install all of the modules from the text file into your virtual environment. This is super helpful when you need to install a large amount of packages and are deploying an application! Note that pandas is not in this list.
* Next, open Eclipse.
* Create a new work space called “PythonWorkSpace” in C:\users\<you>\dev
* Don’t worry about this too much. It’s essentially creating a separate version of Eclipse and creating a new folder called pythonworkspace. Again, don’t fret. Just use this for python projects.
* Alrighty, so you are now in your python work space. Go to the top tool bar and click ‘Help -> Eclipse Marketplace’
* Install the following module:
    * PyDev – Python IDE for Eclipse
    * I would also recommend Darkest Dark Theme with DevStyle because I do not like light styles.
* You will need to restart eclipse for these changes to go into effect. It should prompt you to do so.
* When that is done, go to File -> Import -> General -> Existing Projects into Workspace
* Choose `C:\Users\<your name>\dev\27example` in ‘Select root directory`
* Press finish.
* The following popup will occur: ![eclipse python interpreter](assets/images/eclipsepythoninterpreter.png)
Choose “Manual config”
* In the following popup “Select interpreter”, set:
    * The Interpreter Name: as “python27example venv”.
    * In Interpreter Executable, go to your folder holding your virtual environments ex: C:\Users\<user>\Envs\python27example\Scripts\python.exe
        * This is saying use the python version within your virtual environment (in this case, 2.7)
* Hit OK.
* It will then ask if you want to add folders to the system python path. Hit OK. This is correct.
* Press Apply and Close.
* Eclipse is now using your virtual’s python version.
* So now your project is imported and your python interpreter is set up.
* Next you need to mark / confirm the project is a pydev project!
* Right click the very first folder in your package explorer, i.e. 27example
* Go to PyDev -> Set as PyDev project. Press OK.
* Finally create a new file called “helloworld.py”.
* In this, enter in:
```python
import pandas
 
print “hello world”
```

* Try to run it by pressing the green run button on the top toolbar.
    * It will error! This is because this virtual environment does not have pandas in it
* Change  “import pandas” to:

```python
#import pandas
import flask, requests, numpy
```

* Run again (feel free to delete the old import)
* It will now run fine – you’re good to go!
## This concludes how to download/install python, virtualenv, import projects, and run them.
## Helpful Tips:
* To activate an existing virtual env, enter in your cmd prompt / terminal `workon <virtualname>`
* To remove a virtual environment, just go to your env folder (C:\Users\<your name>\Envs) and delete the folder. It’s that easy.
* Did you install anything in the wrong directory? Press the windows start button, and search "Add or remove programs". On that page, search for the installation you installed incorrectly and uninstall it. Re-install as needed.