---

layout: post
title: "bash: simple bash script to clean a folder"
updated: "3/11/2020"

---

A simple example of how to automate a folder cleaner using shell scripting

```bash
vim clean
```
First we open Vim and create a file called clean

```bash
#!/bin/bash
# A script to clear the folder

rm *.log
rm *.tmp
rm *.bbl
rm *.lof
rm *.dvi
```
At  the top we have a line that lets the program know that we want it to run on
bash. There are more shells than bash, for example *dash* or *sh*  

As you can see `#` is what we use to mark a comment. Then we simply outline all
the commands that the program would have to do. After this we can save and exit
back to the terminal.

```bash
chmod 755 clean
```
To make the program executable we need to change its `chmod` in this case we
chage it to 755 whiche means that the owner can read, write, execute and the
users and group  can read and execute.

```bash
./clean
```
To run the newly created program we just point the terminal to it and execute.
