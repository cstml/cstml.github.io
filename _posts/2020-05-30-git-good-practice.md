---
title: Git Best Practice + some useful commands 
date: 2020-05-30
layout: post
---

# Git Good Practice

Preparing my GitHub for other people to see, and after having a look at
it through other people's eyes - let me tell you - it's quite messy.

So, because I like tidy, simple and minimal, let's have a look at a few
guidelines and conventions that will make your Repo (and mine) look
and feel better

# 1. Keep commits single purpose
 - It helps with other people understanding specifically what has changed on
 what commit and when, and why.
 - It is clear for yourself when you changed studd as well and what stuff you
   changed 

# 2. Write meaningful commit messages
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

# 4. Don't alter published story
- Keep it as is. If you ```git-rebase``` it's probably good practice
not to. Maybe only if you are working by yourself.

# 5. Don't commit generated files
- Pretty simple, keep the ```.gitignore``` up to date and up to scratch
- Commit files you have manually made

# x. A few commands I use all the time 

| Command                          | Utility explanation                                          |
| -------------------------------- | ------------------------------------------------------------ |
| `git log --all -graph`           | It displays the log with a tree diagram on the side, I quite like it for legibility although if you history is quite long it might be a bit much at times |
| `git log --all -graph --oneline` | The compressed version of the above, I find I use this more often than the above |
| `git checkout -b `               | creates the branch and checks it out                         |

*Maybe I should create a macro for them really.

# Further research and links

- This was inspired by [this website](https://deepsource.io/blog/git-best-practices/)
- [Fantastic lecture with very clear explanation](https://missing.csail.mit.edu/2020/version-control/)

- [Pro Git](https://git-scm.com/book/en/v2)