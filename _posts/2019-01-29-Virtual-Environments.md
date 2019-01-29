---
layout: post
title:  "Virtual Environments"
date:   2019-01-29 00:00:00 +0000
categories: python
tags: Python Educational WIP
---

# Disclaimer Intro

Although I have been in and out of learning Python due to work circumstances and education, I've been wanting for a while to drop back into it more actively. So without further ado let us have a look at __'Virtual Environments'__.

## Virtual Environments

# What is it?

From my research, a __Virtual Environmet__ is simply an isolated environment in which one can execute a *Python* project with separate dependencies that are only accessible to that specific __Virtual Environment__.

# Why would I be interested in such a thing?

![Why would you do that][animation]

I hear you, and I have a response.
__Virtual Environmets__ help in avoiding clashes between dependencies. Say you have *Project A* that needs to use some dependencies from *Project B*, respectively *Version 1.0". And then you have *Project C* that needs to use the same dependencies from *Project B* but this time they need to be *Version 2.0*. This is where __Virtual Environments__ come into play.

## How to use Virtual Environments

I would like to thank the guys at [Real Python][link-real-python]. Most of this post is a summary of their post that I will use for future reference.

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

	bin: files that interact with the virtual environment
	include: C headers that compile the Python packages
	lib: a copy of the Python version along with a site-packages folder where each dependency is installed

To use the __virtual environment’s__ packages and resources in isolation, the environment needs to be *activated*.

```bash
source env/bin/activate
```

To deactivate the environment simply type 

```bash
(env) $ deactivate
```

The issue with this is the fact that having multiple virtual environments can become confusing, and one can easily loose track of them. That is where __virtualenvwrapper__ comes into play

## Virtual Environment Wrapper

To install simply type:

```bash
pip install virtualenvwrapper
```

	Once it’s installed, we’ll need to activate its shell functions. We can do this by running source on the installed virtualenvwrapper.sh script. When you first install it with pip, the output of the installation will tell you the exact location of virtualenvwrapper.sh. Or you can simply run the following:

```bash
which virtualenvwrapper.sh
```




[animation]: https://media.giphy.com/media/dILrAu24mU729pxPYN/source.mp4
[link-real-python]: https://realpython.com/python-virtual-environments-a-primer/