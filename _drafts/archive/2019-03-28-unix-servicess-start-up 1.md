---
layout: post
title: 'unix: repeating a command at a time interval'
date: 2019-03-28
updated: 2020-05-24
---
# Repeating a command in the terminal

It is as simple as that. `watch` will repeat a function in the terminal at a specified interval

```
watch -n 2 "ls -l"
```

This command wil simply apply `ls -l` every 2 seconds and it will read the output
