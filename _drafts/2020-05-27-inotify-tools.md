---
layout: post
date: 2020-05-27
title: "Inotify-tools"`
---

In the past days, writing my cv and using latex I found myself having to swap
loads between terminal tabs, until I found this nifty solution- works well for
just compiling loads of tests on the codes that I write.

```
while inotifywait -e modify united.tex; do pdflatex united.tex; done
```
This will watch the file for changes and then upon modification will execute the
pdflatex compilation. In the background I have an instance of zathura running 
with the pdf open which updates automaticly as I save the file within VIM.

Seamless.
