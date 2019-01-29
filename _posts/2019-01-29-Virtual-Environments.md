---
layout: post
title:  "Virtual Environments"
date:   2019-01-29 00:00:00 +0000
categories: python
tags: Python Educational WIP
---

# Disclaimer Intro

Although I have been in and out of learning Python due to work circumstances and education, I've been wanting for a while to drop back into it more actively. So without further ado let us have a look at __'Virtual Environments'__.

# Virtual Environments

## What is it?

From my research, a __Virtual Environmet__ is simply an isolated environment in which one can execute a *Python* project with separate dependencies that are only accessible to that specific __Virtual Environment__.

## Why would I be interested in such a thing?

![Why would you do that][animation]

I hear you, and I have a response.
__Virtual Environmets__ help in avoiding clashes between dependencies. Say you have *Project A* that needs to use some dependencies from *Project B*, respectively *Version 1.0". And then you have *Project C* that needs to use the same dependencies from *Project B* but this time they need to be *Version 2.0*. This is where __Virtual Environments__ come into play.

[animation]: https://media.giphy.com/media/dILrAu24mU729pxPYN/source.mp4