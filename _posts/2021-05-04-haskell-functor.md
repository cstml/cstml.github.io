---
theme: post
date:  03-05-2021
title: "Haskell: Functor"
---

# Functor

Coming from the world of category theore, a functor is a mapping between two
categories:

- in the world of Haskell, usually you can think of it as a type constructor
  with some special properties. It takes an object and it wraps it.
    
*So what?*

- Functors are the building blocks of most `typeclasses` in Haskell

  - [Have a look here to convince yourself](https://wiki.haskell.org/File:Typeclassopedia-diagram.png)
  
- Functors are (by definition) the *pipes* between categories - you might be
  ussing them already without realising

## Use case 

We use Functors so much in haskell that it is hard to think of a case where you
wouldn't use it.

### The Identity Functor

Let's create the simples functor possible

```haskell

-- | Functor is just a wrapper for data 
data Identity a = Identity a deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity m) = Identity $ f m
```

- What does it do?

  - Just wraps whatever you give to it in Identity

- What does it implement to be a Functor?

  - Just `fmap` aka `<$>` with the type signature `(a -> b) -> f a -> f b`. It
    is pretty intuitive this one takes a function from `a -> b` and transforms
    the functor `f a` into a functor `f b`. Easy.
    
- What laws does it need to satisfy?

  - it must preserve the identity morphism
  
    - `fmap Id = Id`
  
  - must preserve composition of morphisms 
   
    - `fmap (f . g) = fmap f . fmap g`

- Example:
```haskell
fmap (+3) $ Identity 3 -- 6
(*2)  ($) $ Identity 4 -- 8
```

- Any funky stuff? 

Glad you asked, yes there is one funky stuff

```haskell
<$ :: a -> f a -> f b
```

It's like half the map to the left (if that makes sense?). So you give it an
element and then you a Functor and then it returns the element wrapped in the
functor (a bit like it pushes the element out)

```haskell
5 <$ Identity 6  -- Identity 5
```

*I mean ok, that's pretty boring we want the funky stuff!* Ok ok, check this
Fun(ky)ctor out

```haskell
(+1) <$ Identity 5 -- of the type :: Num a => Identity (a -> a)
```

Gosh Haskell, higher oreder stuff are great. Do you see what happened? We now
have a higher order identity - a function wrapped in identity. But what can we do with it? Well we can apply it! How? With `fmap` ofc.

```haskell
fmap ($5) ((+1) <$ Identity 3) -- Identity 6
```

Haha, we basically flipped the roles of the function and application, I mean
that' pretty awesome, but also a bit of a mind bender. But Here's another cool thing

Also, if you `import Data.Functor` you get `$>` (which is as you guessed the
opposite of `<$` and also `void` which is `:: f a -> f ()`. Pretty straight
forward.

### In the end

That was it for today. I will try and make an article on each `typeclass` of
Haskell as I am quite enjoying writing these. The next one will probably be on
`Aplicative Functors`, which you probably know where it leads to. 


### More reading 

- [HaskelWiki](https://wiki.haskell.org/Functor)
- [HaskellForAll Article](https://www.haskellforall.com/2012/09/the-functor-design-pattern.html)



