---
layout: post
title: "Bash Watch"
---
## Repeating a function in the terminal
It is as simple as that. `watch` will repeat a function in the terminal at a specified interval
```
watch -n 2 "ls -l"
```
This command wil simply apply `ls -l` every 2 seconds and it will read the output
