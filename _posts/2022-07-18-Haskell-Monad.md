---
theme: post
date:  18-07-2022
title: "Haskell: Monad."
tags: [haskell]
---

> _Or at least my attempt at explaining it_

```haskell

-- The use of this will be explained later
> import Control.Monad ((<=<))

```

A monad is a haskell Class - this means it comes with specific methods. Let's
have a look at what `ghci` has to say about it.

```haskell

λ> :i Monad
class Applicative m => Monad (m :: * -> *) where
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b
  return :: a -> m a
  {-# MINIMAL (>>=) #-}
  	-- Defined in ‘GHC.Base’
instance Monad (Either e) -- Defined in ‘Data.Either’
instance Monad [] -- Defined in ‘GHC.Base’
instance Monad Maybe -- Defined in ‘GHC.Base’
instance Monad IO -- Defined in ‘GHC.Base’
instance Monad ((->) r) -- Defined in ‘GHC.Base’
instance Monoid a => Monad ((,) a) -- Defined in ‘GHC.Base’

```

Ok, so we know it is a subclass of Applicative, we can see it is implemented for
all of these data structures and it comes with some funky looking operators,
namely:

- `(>>=)` aka. bind

- `(>>)`  which I like to call _"and then"_

- `return` - which is the same as `pure` from `Applicative`

I could go on and on about the theoretical foundations of it, but I'd rather
focus on a trivial example.

The identity Monad
---

Let's define our own Monad from scratch to try to understand how it works - for
this I propose the simplest of all _lawful_ monads - the Identity monad. The
reason why I call it a monad is because it behaves like one - i.e. the instance
of Monad is lawful (don't get bogged down, yet in terminology - but keep in
mind).

```haskell

> data Identity a = Identity a

```

As you can see, our Identity data type takes any value and places it
inside. It's so basic that we can guarantee that if we have an `Identity a` we
can always get its content - let's write a function that does just that:

```haskell

> getContent :: Identity a -> a
> getContent (Identity x) = x

```

Mentally we can think of Identity as a Box. 


So what can we say about it? Well firstly - we can be sure it has a lawful
Functor instance. Given any `Box a` and a function `a - > b` we can obtain a
`Box b`:

```haskell

> instance Functor Identity where
>   fmap f (Identity a)  = Identity $ f a 

```

Nice. We can also see that given any _boxed function_ `Identity (a -> b)` and a
_boxed value_ `Identity a` we can get a boxed `Identity b` value. Furthermore,
given any `a` we can always box it into `Identity a`. This is an easy win and we
get our `Applicative` instance.


```haskell

> instance Applicative Identity where
>    (Identity f) <*> (Identity a)  = Identity $ f a
>    pure a = Identity a

```

Ok, so we've done all the footwork up until the Monad instance. Let's have a
closer look at the _bind_ operator `(>>=)`.

```haskell

  Monad m => (>>=) :: m a -> (a -> m b) -> m b

```

If we specialise this operator to what we're trying to achieve it looks more
like this:

```haskell

  (>>=) :: Identity a -> (a -> Identity b) -> Identity b

```

We have the following, a boxed value `a`, a function from `a` to a boxed `b`,
and at the end the result is a boxed `b`. Mentally, we can think of the second
function as something that unboxes the first value, and then returns our new box
- let's see this in our implementation.

```haskell

> instance Monad Identity where
>   (>>=) (Identity value) boxingFunction = boxingFunction value


```

Can you see what we've done? We've unboxed the value, and passed it to our
boxingFunction. Ok, maybe it isn't very clear - but let's take a second and have
a chat about it. Our data type Identity is useless - in many ways it could
disappear from all of our implementations because it doesn't give us much. We
could really push it and say that fundamentally `Identity a` and `a` are one and
the same thing - only one is wrapped in this mental box and the other isn't. We
could  say that our bind is 

``` haskell

  (>>=) ::  a -> (a -> something b) -> something b

```

and if we squint we could almost say that in this instance, Identity doesn't
really give us much more information about anything. We could even say that it's
`(&) :: a -> (a -> b) -> b` from `Data.Function`.

In any case - why does this matter - and how is it relevant? Well here's why it
matters - let's take Maybe as another example. Say we have the function `half`
which returns the half of an even number or `Nothing` if it is an odd number.

```haskell

> maybeHalf :: Int -> Maybe Int
> maybeHalf x
>   | even x    = Just $ x `div` 2
>   | otherwise = Nothing

```

```haskell


λ> maybeHalf 1
Nothing
λ> maybeHalf 2
Just 1

```


Squinting again we see something which we've already seen. `maybeHalf`'s type
looks vaguely familiar - indeed its type is the same as the second argument of
`(>>=)` namely ` a -> m b` or in our case `a -> Maybe b`, or even more specific
`Int -> Maybe Int`. That's great because now we can use the operator:

```haskell

> maybeQuarter :: Int -> Maybe Int
> maybeQuarter x = maybeHalf x >>= maybeHalf

```

Ok, so what happened now? Think of `(>>=)` as taking the result of `maybeHalf x`
and passing it to the function `maybeHalf` again. That's neat because, when we
see it action, it actually makes a lot of sense.

```haskell

λ> maybeQuarter 2
Nothing
λ> maybeQuarter 4
Just 1

```

The do notation
---

Another cool thing Monads unlock is haskell's do notation. Let's refactor the
above `maybeQuarter` to leverage this.

```haskell

> maybeQuarterDo x = do
>   half    <- maybeHalf x
>   quarter <- maybeHalf half
>   return quarter

```

The two are one and the same function - but in different notations. Look at the
do notation one, and then look at the `bind` notation one. Some intuition might
emerge.

Fundamentally, a Monad is a type class that allows us to take an instance of
itself containing a value, and a function from that value to another instance of
itself containing possibly a different value. This allows us to easily compose
monads. One last example

The fish `(<=<)`
---

The fish, is the epitome of what I just said because in the context of a monad
it is the moral equivalent of our composition operator `(.)`.

```text
λ> :t (>=>) :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
λ> :t (.)   ::            (b ->   c) -> (a ->   b) -> a ->   c

```

You can see it, right? So how could we refactor our `maybeQuarter` now?
Whatabout:

```haskell

> maybeQuarterFish :: Int -> Maybe Int 
> maybeQuarterFish = maybeHalf <=< maybeHalf

```

End
---

That was it. I'm sure it all makes sense now - maybe. 
