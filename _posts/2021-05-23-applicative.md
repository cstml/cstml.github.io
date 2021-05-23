---
theme:  post
date:   23-05-2021
title: "Haskell: Applicative"
---
## And a bit of Traversable

- [Hackage Applicative Documentation](https://hackage.haskell.org/package/base-4.15.0.0/docs/Control-Applicative.html)
- [Hackage Traversable Documentation](https://hackage.haskell.org/package/base-4.15.0.0/docs/Data-Traversable.html)

## What are they?

### `Applicative` 

- An `Applicative` is short for a *strong lax monoidal functor* or some people might call it an *Applicative Functor*. 

- In Haskell - it is a **Functor** that comes with an operation `<*> :: f (a -> b) -> f a -> f b` that tells it how to **Apply** a higher level `Functor` to another `Functor`. 

- If you remember from the [`Functor`](https://cstml.github.io/2021/05/03/haskell-functor.html) article, we already defined what a `Functor` is and what `fmap` (aka. `<$>`) with the type `(a -> b) -> f a -> f b` do. Comparing them:

```haskell
<?> ::   (a -> b) -> f a -> f b
<*> :: f (a -> b) -> f a -> f b
```

- In essence the difference is that with `<$>` the function is *flat* - i.e. outside the realms of the `Functor` and it is injected inside. 

- In `<*>` ( a.k.a. *"splat"* - as I have just found out during an interview earlier this week) the first argument is a **lifted** function - i.e. the `Functor` contains a higher order type.

---

- for Haskell to believe you a type is an instance of an `Applicative` it is sufficient to prove it has the functions:
  - `pure` of type `Applicative f => a -> f a`, and 
  - either:
    -  `<*>` of type `Applicative f => f (a -> b) -> f a -> f b`, or
    -  `liftA2` of type `Applicative f => (a -> b -> c) -> f a -> f b -> f c`.

- Other laws that it must satisfy:
  - *Identity* `pure id <*> v = v`
  - *Composition* `pure (.) <*> u <*> v <*> w = u <*> (v <*> w)`
  - *Homomorphism* `pure f <*> pure x = pure (f x)`
  - *Interchange* `u <*> pure y = pure ($ y) <*> u` 
    - For the whole list with further conversation it would be good to consult [hackage](https://hackage.haskell.org/package/base-4.15.0.0/docs/Prelude.html#t:Applicative).
 
--- 

## Scenario

Lets say we want to have a type `Doer` that stores both a type and its **meta sign**- *which is a property we came up with*. 

The meta sign has the following behaviour: when we do operations with these type, the signs interact and the resulting sign follow the normal sign rule i.e. : 
  - `+ & +` = `+`, 
  - `+ & -` = `-`, 
  - `- & +` = `-`, 
  - `- & -` = `+`.

*I would also like to introduce the use of `GADTs` in this case, as it makes working with the type nicer. Note that this could have been done without it, but I thought it would be clearer what we are doing by using them.*

---
## Implementation

- As mentioned before lets enable `GADTs`, and also let's import the `Applicative` module 

```haskell
{-# LANGUAGE GADTs #-}
import Control.Applicative
```

---

- And continue by defining our types. Let us define the type `Op` which is our **meta sign**. We also implement a `Show` so we can display it nicely.

```haskell
data Op = Add | Sub deriving (Eq)

instance Show Op where
  show o = if o == Add then "+" else "-"
```

---

- Now we can define our sign rule function that combines the two `Op`s.

```haskell
signRule :: Op -> Op -> Op
signRule x y
  = case x of
      Add -> case y of
                Add -> Add
                Sub -> Sub
      Sub -> case y of
                Add -> Sub
                Sub -> Add
```

- But if we look, we can see a pattern - `Op` is a `monoid` where `Add` is the neutral element. So let's make use of this and also enrich our type with another of its *inherent - discovered* properties. 
- *Note: algebraic properties are discovered and not designed - they are inherent to the type itself. You can design your types to make use of types that have the properties or not - but you cannot design the property into a type - if it doesn't have it.*


```haskell
instance Semigroup Op where
  (<>) = signRule

instance Monoid Op where
  mempty = Add 
```

--- 

- Next let's define our type `Doer`. In this implementation, our type constructor `ON` takes a meta sign `Op` and any type `a` and it creates an instance of `Doer a` - think of it like an embellished type that contains our meta-sign.

```Haskell
data Doer a where
  ON :: Op -> a -> Doer a
  deriving (Show, Eq)
```

---

- And let's look at a few examples that would make it clear

```Haskell
ex0 =  ON Sub 3            -- ON - 3
ex1 =  ON Add "Hello"      -- ON + "Hello"
ex2 = [ON Sub 3, ON Add 2] -- [ON - 3,ON + 2]
```

We can see that `Doer a` is a `Functor`. Let's prove it.

```Haskell
instance Functor Doer where
  fmap f (ON o x) = ON o $ f x
```

Now, let's prove it is an `Applicative`. 

```Haskell
instance Applicative Doer where
  pure                      = ON (mempty::Op)
  (<*>) (ON o f) (ON o' n') = ON (o <> o') (f $ n')
```

Note: we made use in `(o <> o')` of our previously *discovered* `Monoid` property. The reader (yes, you) can check that the rest of the laws of the `Applicative Functor` stand.

---
#### Intermission
- *Why does this all matter?*
- It matters because our type `Doer` would not be a very good `Monad` as it wouldn't be able to properly communicate what the `Op` is between binds - due to the fact that `pure` and `return` must be equivalent. So for it to be a useful `Monad` we would have to rethink its type.

```haskell
instance Monad Doer where
  return = pure
  (>>=) (ON o n) f = f n  -- observe how we cannot 
                          -- control what happens with o
```

- So `Applicative` functors allow us to work with the structure in exciting ways, without it needing to be a `Monad`

---

#### Back to our implementation - Examples

- OK I'm glad to say that we've covered most of the info regarding `Applicative`, some examples to see it in action would be good.

---

#### Example 1: 

Let's use our *splat* to apply the lifted function `(+1)` to a functor:

```haskell
ex01 = ON Sub (+1) <*> ON Sub 1 -- ON + 2
--   = ON - (+1) <*> ON - 1     -- this is what happens
--   = ON ( - <> - ) (1 $ (+1))
--   = ON + 2
```
So it works as intended, we have the result of the operation and the result of the interaction between their meta signs. 

---
#### Example 2: 

We want to compose two functions and apply them to a `Functor`

```haskell 
ex02 = pure ((+1). (+2)) <*> ON Sub 3 -- ON - 6
```

Is there another way to write this? Of course, and it might give some insight into what actually happens:

```haskell
ex03 = pure (.) <*> pure (+1) <*> pure (+2) <*> ON Sub 3 -- ON - 6
```

Explanation: we lift the composition, we partially apply it to the lifted `(+1)` we then apply it to the lifted `(+2)` giving us the lifted composition of `(+1)` and `(+2)`. Then in the end we apply this to lifted `3` and we get lifted `6`. As the functions are pure our meta sign is not altered.

---

#### Example 3: 

We want to do the previous while changing our meta sign accordingly.

```haskell
ex04 = pure (.) <*> ON Sub (+1) <*> ON Add (+2) <*> ON Sub 3 -- ON + 6
```

Isn't that fantastic: 
  - we already know that `6` is the result of the function application
  - `- + - ` = `+` - which gets through to us in the type.

---

#### Example 4: 

Say we have a list of `Doer`s and a higher typed `Doer` and we want to `fmap` it.

```haskell
ex2  = [ON Sub 3, ON Add 2]
ex05 = (pure (+1) <*>) <$> ex2    -- [ON - 4,ON + 3]
```
This is interesting - we can observe here what is going on - if we refactor again with something that we've seen before:

```haskell
ex05' = (fmap (+1)) <$>  ex2    -- [ON - 4,ON + 3]
ex05''= fmap (fmap (+1)) ex2    -- [ON - 4,ON + 3]
```

This behaviour is linked to the definition of `pure`. But the added benefit of being able to interact through `<*>` is that it easily allows us to change the meta-sign.
```haskell
ex06 = ((ON Sub (+1)) <*> ) <$> ex2  -- [ON + 4,ON - 3]
```
Observe how in `ex06` the meta signs have flipped.

---
## Traversable Time


### What is it ?

- It is a `typeclass` that can be traversed from left to right - but its uses are a bit more subtle than that - and we'll talk a bit more about it when time comes.

- I'm not going to go very in depth with regards to `Traversable`, because the post would fork too much (I will make a dedicated post at some point) - but it's important to note that `Traversable`, `Applicatives`, `Monads` are very tightly connected. (The wiki article is a good read)

- Note: in the examples the `Traversable, Foldable t` is the `[]` type. 

### Examples
- Example: say we take a list of `Doer`s and we want to nest it into a `Doer` type itself, with the correct meta-sign (the sign of folding all the meta signs inside the list with the `<>` we defined) while in essence unwrapping the elements. The type of this function would look something like: 

```haskell 
squishSign :: [Doer a] -> Doer [a]
```

So here are the challenges we are facing:
- if we `foldMap :: Monoid m => (a -> m) -> t a -> m` we need to do quite a bit of work to to get our `Doer` to match that type - not ideal - and we are lazy. 
- Wouldn't it be nice if we had some sort of function that would traverse our list, do something with the type and then at the end gives us that something? Don't worry Haskell has our back:

```haskell
sequenceA :: (Traversable t, Applicative f) => t (f a) -> f (t a)
```

- observe how that `t` and `f` swap positions - that is what we want to do. We know `Doer` is `Applicative`, and we know that `[]` is `Traversable` so what are we waiting for:

```haskell
squishSign :: [Doer a] -> Doer [a]
squishSign  = sequenceA . (\x -> case x of
                                   [] -> []
                                   _  -> x ) 
```

I wrote it as a section as it reads a bit better - but let's see it in action:

```haskell
ex11 = squishSign [ON Sub 3, ON Add 2]           -- ON - [3,2]
ex12 = squishSign [ON Sub 3, ON Add 2, ON Sub 3] -- ON + [3,2,3]
```

Now we can apply some more functy (funky + functor) things we've seen earlier.

```haskell
ex13 = pure sum <*> squishSign [ON Sub 3, ON Add 2, ON Sub 3] -- ON + [8]
```

This has been a well long post, and we've had a lot of *functy* time together. What other cool `Applicative` and `Traversable` design patterns do you use or have discovered? Let me know!

## More reading
- [Haskell Wiki Traversable](https://en.wikibooks.org/wiki/Haskell/Traversable)
