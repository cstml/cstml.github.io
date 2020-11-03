---
layout: post
title: "Terminal Background Processes"
---

Previously, before finding out about this I use to interrupt processes with
`CTRL-Z`. But as you can guess where this is going: **It is wrong**, or at
least not the right way to do it. 

What is the correct way? Simple, just use `CTRL-C`which halts the process or
*Cancels* it.

But what does `CTRL-Z` do?

It suspends temporarily the process and puts it in the background.

To see a list of all the processes simply type: `jobs`. This will return a list
of all the jobs suspended or running.

To continue a job and bring it to the foreground you type `fg`. To bring a
specific one to the surface, type `fg 1` where 1 is the id of the job.

To continue a job in the background: `bg`.

To terminate a job that is running in the background or that is suspended `kill
%1`

Where `1` is the job id
