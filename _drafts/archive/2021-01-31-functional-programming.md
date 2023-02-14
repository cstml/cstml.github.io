---
theme: post
date:  31-01-2021
title: "λ: functional programming"
---

# Functional Programming

*(edited 2021-05-05)*

In my years of programming, I have developed techniques and ways in which I go
about resolving problems and tasks. As I was talking to a friend the other day,
I realised that the interesting thing about functional programming is that many
of the methods of solving things *functionally* were already part of my tool
set, without having the awareness that they were *functional methods*. Rather my
style evolved to encompass them out of personal preference and conceptual
ease. 

The realisation and study of *functional programming* has revolutionised the way
I code, but rather has reinforced specific practices and *reduced* (sic.) others
to complete *no go status*. To celebrate the fact that I will be studying a
module of functional programming and lambda calculus as part of my MSc in
Computer Science, I set out to write this small post. Hopefully as I learn more,
I will update it and make it reflect more accurately my understandings.

--- 

Functional programming was a breakthrough and a major change (for the better) in
my mindset about writing code and thinking about programming. I now try and
functional code as much as possible, independently of language.


### Benefits 

1. Functions and types can be composed - very much LEGO like. As long as the
   types match, it will work. This is probably the most appealing bit for
   myself.

2. Functional code tends to be easier to debug, test and maintain. Not having
   side effects (mostly) to worry about means that most computation acts in a
   deterministic manner.
   
3. Functional programing allows you to thinks about the big picture as you end
   up writing what things *should do* rather than *how to do*.


## So how do you do it

There are tools and techniques that allow one to make program in a functional
way.

1. **functions** - in Python functions are first class citizens, so lambda
   notation makes it easy to define them on the go and in place - note that
   lambda functions are used more so in functional programming, because of
   convenience (it confused me at first, because I thought it was essential to
   have functions defined as lambda functions, but there is no real difference
   between a lambda and a *normal* defined function. So use them as you find
   adequate).

2. **higher order functions** are functions that take a function as one of their
   parameters. In `Haskell` it is easy to spot them as their type always
   contains something like `(a->b)`. Some examples:
   
  1. **map** - map does exactly what it says - maps items from one set to
   another with the use of a function - in practical, simple terms, takes an
   iterable object ( a vector or a list or etc) and applies a function to each
   element, returning a new element containing the result of each function
   application
   
  2. **filter** - self describing, filters elements from a set based on a yes no
   function - think of it like a map that either returns the element itself or
   not
   
  3. **fold** - takes an iterable element and replaces the type constor with a
   new function - usually used with the purpose of reducing it. A `sum` fold for
   exapmle is like a map function that works on two elements of the list at a
   time, with a carry.

3. **types** and **type constructors** are what allows us to constrain and
   define our data. In pure functional programming, the types of functions and
   objects are the main way of reasoning about what can and cannot be composed,
   and one of the most important tools in a functional programming toolset. 
   
## Examples in Python and Haskell

### 1. Functions

```python
a = lambda x    : x + 1          # returns + 1
b = lambda x, y : x + y          # returnx x + y
c = lambda x : lambda y : x + y  # curried version of b 
```


```haskell
a = \x       -> x + 1             -- returns + 1
b = \(x,y)   -> x + y             -- returnx x + y
c = \x -> \y -> x + y             -- curried version of b 
```

    
### 2. Higher order functions

#### a. mapp

python:
```python
a = [1,2,3,4]
b = map (lambda x : X + 1, a) # this will return a map object
                              # because python implements lazy evaluation
print(list(b))                # so we need to cast it to a list to print
```

haskell:
```haskell
a = [1,2,3,4]
b = fmap (\x -> x + 1)        -- this will return a function that takes
                              -- a foldable item and returns its mapped version
```


#### b. Filter

python:
```python
c = filter(lambda x : x % 2, b) # this will filter all eveb numbers
print(list(c))                 
```

haskell:
```haskell
c = filter (not . odd)         -- this will return all even numbers
```


#### c. Fold

python:
```python
functools.reduce(lambda x,y : x + y, a , 0) # this will return 10
functools.reduce(lambda x,y : x + y, a , 2) # this will return 12
```

haskell:
```haskell
c = foldr1 (+)                 -- fold
```
