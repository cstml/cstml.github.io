---
theme: post
date:  31-01-2021
title: "λ: functional programming"
---

# Functional Programming

In my years of programming, I have developed techniques and ways in which I go
about resolving problems and tasks. As I was talking to a friend the other day,
the interesting thing about functional programming is that many of the methods
of solving things *functionally* were already part of my tool set, without being
aware that they were a *functional method*. Rather my style evolved to encompass
them out of personal preference and conceptual ease. The realisation and study
of *functional programming* hasn't revolutionised the way I code, but rather has
reinforced specific practices and *reduced* (sic.) others to complete *no go
status*. To celebrate the fact that I will be studying a module of functional
programming and lambda calculus as part of my MSc in Computer Science, I set
out to write this small post. Hopefully as I learn more, I will update it and
make it reflect more accurately my understandings.

--- 

Personally, the function programming style for me was a breakthrough and a major
change (for the better) in my mindset about writing code and thinking about
programming. I now, try and achieve a functional style in every implementation I
do (as much as possible), independently of language.

## Benefits - from experience

1. Functional code tends to be much easier to debug, test and maintain. Not
   having local states to worry about means that everything acts in a
   reproducible manner. 

2. Each function can be tested individually, and components can be assembled,
   very much LEGO like. As long as the types match, it will work. This is
   probably the most appealing bit for myself.
   
3. Functional code thinks about the big picture. When you manipulate structures
   rather than iterate and work on individual items, from a personal point of
   view I find I tend to think in wide brush strokes about how to deliver the
   wanted result

## Principles of Functional Programming

Without going into the full *spiel* of Functional Programming, there are a few
things that one should aim to achieve to write code in a functional manner:

1. Treat data and structures as immutable objects - this means do not tamper the
   data or information inside the scope of a function.

2. Change within the program happens through the use of a function - we use
   function here in its mathematical sense. A function, in simple terms is just
   an arrow mapping two elements from two sets. (as a side note, I recommend
   going through concepts of **Lambda Calculus and Notation**)
   
The above statements seem very restrictive at a first glance, but once you get
the hang of it you will see how powerful these ideas are.


## So how do you do it

Again, keeping it succinct there are simple tools and techniques that allow one
to make program in a functional way. For now I will talk about them from the
Python point of view, and these are:

1. **functions** - in Python functions are first class citizens, so lambda
   notation makes it easy to define them on the go and in place - note that
   lambda functions are used more so in functional programming, because of
   convenience (it confused me at first, because I thought it was essential to
   have functions defined as lambda functions, but there is no real difference
   between a lambda and a *normal* defined function. So use them as you find
   adequate).
   
2. **map** - map does exactly what it says - maps items from one set to another
   with the use of a function - in practical, simple terms, takes an iterable
   object ( a vector or a list or etc) and applies a function to each element,
   returning a new element containing the result of each function application
   
3. **filter** - self describing, filters elements from a set based on a yes no
   function - think of it like a map that either returns the element itself or
   not
   
4. **reduce** - takes an iterable element and applies a function to it with the
   purpose of reducing it. The way I think about it is like a map function that
   works on two elements of the list at a time, with a carry.

5. **lists** - lists are the main iterable structure used in Functional
   Programming. Although languages like *Clojure* expands these capabilities to
   maps and vectors and etc. The list we are talking about is the classic LISP
   linked list where each element has a *CAR* and a *CDR*. The first being the
   value of the element and the second a pointer to the next element in the
   list.
   
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

    
### 2. Map
```python
a = [1,2,3,4]
b = map (lambda x : X + 1, a) # this will return a map object
                              # because python implements lazy evaluation
print(list(b))                # so we need to cast it to a list to print
```

```haskell
a = [1,2,3,4]
b = fmap (\x -> x + 1)        -- this will return a function that takes
                              -- a foldable item and returns its mapped version
```

### 3. Filter
```python
c = filter(lambda x : x % 2, b) # this will filter all eveb numbers
print(list(c))                 
```

```haskell
c = filter (not . odd)         -- this will return all even numbers
```

### 4. Reduce
```python
functools.reduce(lambda x,y : x + y, a , 0) # this will return 10
functools.reduce(lambda x,y : x + y, a , 2) # this will return 12
```

```haskell
c = foldr1 (+)                 -- recursively fold
```
