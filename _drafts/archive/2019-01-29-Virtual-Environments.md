---
layout: post
title:  "python: virtual Environments"
date:   2019-01-29 00:00:00 +0000
updated: 2020-05-30
categories: python
tags: Python Educational WIP
---

# Python 3
For Python 3 to initialise a venv you would use:
```
python3 -m venv /path/to/new/virtual/environment
```

# Disclaimer Intro

Although I have been in and out of learning Python due to work circumstances
and education, I've been wanting for a while to drop back into it more
actively. So without further ado let us have a look at __'Virtual
Environments'__.

## Virtual Environments

# What is it?

A __Virtual Environmet__ is simply an isolated environment in
which one can execute a *Python* project with separate dependencies that are
only accessible to that specific __Virtual Environment__. 

# Why would I be interested in such a thing?

![Why would you do that][animation]

I hear you, and I have a few motivations:
- __Virtual Environmets__ help in avoiding clashes between dependencies. Say you
have *Project A* that needs to use some dependencies from *Project B*,
respectively *Version 1.0". And then you have *Project C* that needs to use the
same dependencies from *Project B* but this time they need to be *Version 2.0*.
This is where __Virtual Environments__ come into play.
- Being able to execute the code on a different machine - it is useful if you want to have consistent behaviours across different machines and if you want to have consistency of dependencies in your code.

## How to use Virtual Environments
# For python
I would like to thank the guys at [Real Python][link-real-python]. Most of this
post is a summary of their post that I will use for future reference.

```bash
pip install virtualenv
```

Afterwards simply create a new folder

```bash
mkdir python-virtual-environments && cd python-virtual-environments
```

Then create the environment.

```bash
virtualenv env
```

This will basically set up an env folder which contains 

> * bin: files that interact with the virtual environment
> * include: C headers that compile the Python packages
> * lib: a copy of the Python version along with a site-packages folder where each dependency is installed

To use the __virtual environment’s__ packages and resources in isolation, the environment needs to be *activated*.

```bash
source env/bin/activate
```

To deactivate the environment simply type 

```bash
(env) $ deactivate
```

The issue with this is the fact that having multiple virtual environments can become confusing, and one can easily loose track of them. That is where __virtualenvwrapper__ comes into play

# For python3

**Python3** is a bit different as it uses the **virtualenvironment** module to create it and it also makes use of **pip3**

```bash
python3 -m venv <venv_name>
```

The way to activate it is as above. Another difference to keep in mind is that Python3 makes use of pip3 so wheneve you install a dependency be sure to do `pip3 install`


[animation]: https://media.giphy.com/media/dILrAu24mU729pxPYN/source.mp4
[link-real-python]: https://realpython.com/python-virtual-environments-a-primer/
