---
theme: post
date:  2021-05-03
title: "Haskell: Functor"
tags: [haskell]
---

Coming from the world of category theory, a functor is a mapping between two
categories:

- in the world of Haskell, usually you can think of it as a type constructor
  with some special properties. It takes an object and it wraps it.
    
- Functors are the building blocks of most `typeclasses` in Haskell

  - If that sounds like a bold claim, 
    [Have a look here to convince yourself](https://wiki.haskell.org/File:Typeclassopedia-diagram.png)


- Functors are (by definition) the *pipes* between categories - you might be
  using them already without realising


## Use case 

We use Functors all the time - it is hard to think of a case where you wouldn't
use it.


### The Identity Functor

Let's create the simplest functor possible

```haskell
data Identity a = Identity a deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity m) = Identity $ f m
```


- TL;DR What does it do?

  - Transforms whatever you give to it into the  `Identity` type.
  

- What does it need to implement to be a Functor?

  - `fmap` aka `<$>` with the type signature `(a -> b) -> f a -> f b`. It is
    pretty intuitive this one takes a function from `a -> b` and transforms the
    functor `f a` into a functor `f b`. Easy.
    
----

- What laws does it need to satisfy?

  - it must preserve the identity morphism
  
    - `fmap Id = Id`
  
  - it also must preserve composition of morphisms 
   
    - `fmap (f . g) = fmap f . fmap g`

---

- A few examples using our Identity functor:

```haskell
fmap (+3) $ Identity 3 -- 6
(*2)  <$> $ Identity 4 -- 8
```

---

- Other functor functions:

```haskell
<$ :: a -> f a -> f b
```

- It's *half the fmap to the left* (if that makes sense?). You give it an
  element and then you give it a functor, and it returns the element wrapped in
  the functor (a bit like *it pushes the element out* of the functor and
  replaces it with what is on the left).

- an example:
```haskell
5 <$ Identity 6  -- Identity 5
```

---

- That is quite neat. You can even use it with higher types for example:

```haskell
(+1) <$ Identity 5 -- of the type :: Num a => Identity (a -> a)
```

Do you see what happened? We now have a higher order `Identity` type - a
function wrapped in `Identity`. But what can we do with it? Well we can apply
it - with `fmap` again.

```haskell
fmap ($5) ((+1) <$ Identity 3) -- Identity 6
```

- We basically flipped the roles of the function and application. And of course
  `($5) :: (a -> b) -> b` is a function that takes a function and it applies
  to `5`.

- Also, if you `import Data.Functor` you get `$>` (which is as you guessed the
  opposite of `<$`) and `void` which is `:: f a -> f ()`. Pretty straight
  forward.


### In the end

That was it for today. I will try and make an article on each `typeclass` of
Haskell as I am quite enjoying writing these. The next one will probably be on
`Applicative Functors`, which you probably know where it leads to.

----

### More reading 

These are all very basic applications and simple examples. But if you are
curious here is some further reading:

- [Bartosz Milewski's Book is a fantastic resource](https://github.com/hmemcpy/milewski-ctfp-pdf)
- [HaskelWiki](https://wiki.haskell.org/Functor)
- [HaskellForAll Article](https://www.haskellforall.com/2012/09/the-functor-design-pattern.html)
- [Haddock](https://hackage.haskell.org/package/base-4.15.0.0/docs/Prelude.html#t:Functor)
