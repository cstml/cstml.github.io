---
theme: post
date: 18-12-2020
title: "TTL Lisp: 01 Atoms, Lists, S-expressions"
---

# Introduction

Atoms, Lists and Symbolic Expressions sit at the heart of Lisp as a language.
Dissimilar from other programming languages, Common Lisp has very little
syntax, and it can be reduced to these 3 elements. Understanding how they work
will allow you to read Common Lisp in no time. 

---

## Atoms

Atoms are the basic syntactic element of CLisp. Atoms can be constructed with
symbols and numbers. Let's have a look at how each of these can be constructed:

#### Symbolic Atoms : 
  - `cat`       symbolic atom formed from letters
  - `mouse1`    symbolic atom formed from letters and numbers
  - `mouse-and-cat` symbolic atoms can be hyphenated
  - `*top-cat*` symbolic atom with *ear-muffs* - is usually used as a 
  **top level definition** (global variable in Lisp speak)
  - `+` symbolic atom - in CLisp also representing the addition function
  - `pi` a standard CLisp atom that gets interpreted to the closest estimation
  of pi
  - `'(+ a 2)` is a symbolic atom due to the use of the `'` which indicates to
  the interpreter that the expression should be read as an atom rather than an
  expression

Ok, after seeing all the possibilities that CLisp has for a symbolic atom, let
us have a look at numerical atoms.

#### Numerical Atoms
  - `123` integer numeric atom
  - `#b1001` binary numeric atom
  - `2/3` fractionally numeric atom
  - `2.4` floating point numeric atom

#### Special Atoms
  - `t` meaning true
  - `nil` meaning the absence of an atom

---

## Lists

Lists are a fundamental structure of CLisp. Lists are sequences of atoms
separated by spaces or lists. The standard notation for a list is `(atom0
atom1)`. Let us write a few lists:

  - `(1 2 3 4)`                 list of numerical atoms 
  - `(1 2 a b)`                 list of numerical atoms and symbolic atoms
  - `(1 (2 3) 4)`               list of numerical atoms and a list of numerical atoms
  - `(+ 1 (cat dog *mouse*))`   list of symbolic atoms and numerical atoms
  - `()`                        an empty list - without any atoms present 

As we can see  from the above, list



