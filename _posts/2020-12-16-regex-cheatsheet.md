---
layout: post
title: "regex: grep/egrep cheatsheet"
date: 2020/12/16
categories: [unix,cheatsheet]
---

Let's have a look at the `grep` and `egrep` commands.

# `egrep` `grep` `regex`

First if you want the full capabilities in `grep` you have to run it with `-E` flag or go for `egrep` 

## Flags

| Flag | Description                                                  |
| ---- | ------------------------------------------------------------ |
| `-i` | ignores case                                                 |
| `-v` | return all lines which don't match pattern (not matching)    |
| `-w` | The expression is searched for as a **word** (as if surrounded by `[[:<:]]' and `[[:>:]]' |
| `-c` | count of matching lines                                      |
| `-l` | print the name of the file with the match                    |
| `-n` | print the line number                                        |
| `-r` | recursively read all the files in the location               |
| `-o` | only matching                                                |
|      |                                                              |

## RegEx Syntax

| Symbol    | Description                                |
| --------- | ------------------------------------------ |
| `[abc]`   | range, i.e. any of `a` `b` `c`             |
| `[^abc]`  | not range, i.e. not any of `a` `b` `c`     |
| `(abc)`   | group, can be then used later on           |
| `\n`      |                                            |
| `|`       | **or**, the logical operator               |
| `\\`,`\*` | removes the special meaning of a character |

## RegEx Locations and Anchors

| Symbol | Description                             |
| ------ | --------------------------------------- |
| `^`    | beginning of the line                   |
| `$`    | end of the line                         |
| `\<`   | beginning of the word                   |
| `/>`   | end of the word                         |
| `\b`   | match either beginning or end of a word |

## RegEx Multipliers

| Symbol  | Description                               |
| ------- | ----------------------------------------- |
| `?`     | optional (matched 0 or 1 times)           |
| `*`     | Kleene star (matched 0 or infinite times) |
| `+`     | Kleene plus (matched 1 or infinite times) |
| `{n}`   | matched n times                           |
| `{n,}`  | matched n times or more                   |
| `{n,m}` | matched between n times and m times       |

## Used Often + examples

`egrep -o '([0-9]+\.){3}([0-9]+)' | sort --unique ` - IPV4 pipe that only displays unique entries

