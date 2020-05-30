---
title: Git Best Practice
date: 2020-05-30
layout: post
---

Preparing my GitHub for other people to see, and after having a look at
it through other people's eyes - let me tell you - it's quite messy.

So, because I like tidy, simple and minimal, let's have a look at a few
guidelines and conventions that will make your Repo (and mine) look
and feel better

# 1. Keep commits single purpose
 - It helps with other people understandins specifically what has changed on
 what commit and when, and why.
 - It is clear for yourself when you changed studd as well and what stuff you
   changed 

# 2. Write meaningfull commit messages
- Very very easily said, but I almost never have done it
- This is a great system :

```
feat: add beta sequence
^--^  ^---------------^
|     |
|     +-> Summary in present tense.
|
+-------> Type: chore, docs, feat, fix, refactor, style, or test.
```
not only does it give you structure but it is so legible. Genius!

# 3. Commit Early, Commit Often
- This is one thing I probably overdo. But apparently it is 
good practice *winning*. In one of my former jobs, the electricity
used to cut-off randomly, and let me tell, it doesn't take a lot
of lost work to start impulsive logging.

# 4. Dont alter published story
- Keep it as is. If you ```git-rebase``` it's probably good practice
not to. Maybe only if you are working by yourself.

# 5. Don't commit generated files
- Pretty simple, keep the ```.gitignore``` up to date and up to scratch
- Commit files you have manually made

This was inspired by [this website](https://deepsource.io/blog/git-best-practices/)
