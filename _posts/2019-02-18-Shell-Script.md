---
layout: post
title: "Shell Scripts"
---

A simple way to make a folder cleaner using shell script

```
vim clean
```

```
#!/bin/bash
# A script to clear the folder

rm *.log
rm *.tmp
rm *.bbl
rm *.lof
rm *.dvi
```

```
chmod 755 clean
```

```
./clean
```
