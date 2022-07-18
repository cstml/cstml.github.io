---
theme: post
date:  04-08-2021
title: "Haskell: Either."
---

Either
------

Either is the `Prelude` provided type that allows us to work with functions that
can return _either one result or another_. It does this by providing two
constructors:

```haskell

> -- | remember this as it will come in handy later
> import Control.Monad (join)

> -- | Ignore the ' as they are there to not clash with the Prelude Either.
> data Either' e a
>   = Left'  e  -- ^ Left allows us to return an error, or short circuit.
>   | Right' a -- ^ Right allows us to return the result

```

For example say we were implementing a (safe) function for division - we could
do it like this:

```haskell

> division :: Int -> Int -> Either String Int
> division a b 
>     | b == 0    = Left "Sorry, cannot divide by 0."
>     | otherwise = Right $ a `div` b

```

Now if we wanted to use the result we could pattern match:

```haskell

> calculate :: IO ()
> calculate = do
>     let n = 40
>     putStrLn $ "Please enter a number to divide " ++ show n ++  " by: "
>     y <- readLn :: IO Int
>     x <- pure $ division n y
>     case x of
>       Right x' -> print x'
>       Left e   -> print $ "Oh no:" ++ e

```

A better way to use either
---

OK so that's pretty good already. We have managed to create a pure function that
takes our sum type, and can handle errors. But `Either` actually gives us a neat
function to tidy up that pattern match into a simpler pattern. I am talking here
about `either` (which is indeed very similar to `Maybe`'s `maybe`).

```haskell

> calculate2 :: IO ()
> calculate2 = do 
>     let n = 40
>     putStrLn $ "Please enter a number to divide " ++ show n ++  " by: "
>     y <- readLn :: IO Int
>     x <- pure $ division n y
>     either leftFn rightFn x
>       where
>         leftFn = print . ("Oh no: " ++)
>         rightFn = print
>
>  -- or inlined it would look like this 
>
> calculate2' :: IO ()
> calculate2' = do 
>     let n = 40
>     putStrLn $ "Please enter a number to divide " ++ show n ++  " by: "
>     y <- readLn :: IO Int
>     x <- pure $ division n y
>     either (print . ("Oh no: " ++)) print x

```

Where the first function will be applied to the `Left` and the second to the
`Right`.

The Applicative nature of `Either`
---

Say we wanted to check if the result is odd. The `Functor` nature of `Either`
allows us to access the Right side with the use of `<$>` (fmap - see the
previous article).

```haskell

> calculate4 :: IO ()
> calculate4 = do
>     let n = 40
>     putStrLn $ "Please enter a number to divide " ++ show n ++  " by: "
>     y <- readLn :: IO Int
>     either print print $ odd <$> division n y 

```

So what happened here is that we `fmap`ed the result of the division with
`odd`. This is the equivalent of the `Applicative`:


```haskell

> calculate4' :: IO ()
> calculate4' = do
>     let n = 40
>     putStrLn $ "Please enter a number to divide " ++ show n ++  " by: "
>     y <- readLn :: IO Int
>     either print print $ pure odd <*> division n y 

```

The great thing about it is that now we can essentially chain functions by using
this new *lifting functions* pattern, while still maintaining the safe way of
working with `Either`.


```haskell

> calculate4'' :: IO ()
> calculate4'' = do
>     let n = 40
>     putStrLn $ "Please enter a number to divide " ++ show n ++  " by: "
>     y <- readLn :: IO Int
>     either print print $ pure oddDisplay <*> (pure odd <*> division n y)
>       where
>         oddDisplay x = if x then "Is Odd!" else "Is not Odd" 

```

Of course this could also be refactored to

```haskell

> calculate4''' :: IO ()
> calculate4''' = do
>     let n = 40
>     putStrLn $ "Please enter a number to divide " ++ show n ++  " by: "
>     y <- readLn :: IO Int
>     either print print $  pure (oddDisplay.odd) <*> division n y
>       where
>         oddDisplay x = if x then "Is Odd!" else "Is not Odd" 

```

Further use of `Either`
---

Okay, but what if we wanted to chain two `Either`s? Well a basic way of doing it
would be again by pattern matching.

```haskell

> calculate3 :: IO ()
> calculate3 = do
>     let n = 40
>     putStrLn $ "Please enter a number to divide " ++ show n ++  " by: "
>     y <- readLn :: IO Int
>     putStrLn $ "Please enter a number to divide the result by: "
>     z <- readLn :: IO Int
>     x <- pure $ division n y
>     case x of
>       Left e   -> print $ "Oh no:" ++ e
>       Right x' -> case division x' z of
>         Left e   -> print $ "Oh no:" ++ e
>         Right z' -> print z'

```

But this is a bit weird, because we are repeating ourselves, and we are also
writing a lot of boilerplate code for something which in essence could be done a
lot easier. *Here comes the Applicative again.*

```haskell

> calculate3' :: IO ()
> calculate3' = do
>     let n = 40
>     putStrLn $ "Please enter a number to divide " ++ show n ++  " by: "
>     y <- readLn :: IO Int
>     putStrLn $ "Please enter a number to divide the result by: "
>     z <- readLn :: IO Int
>     either print print $ divide n y z
>       where
>         divide :: Int -> Int -> Int -> Either String Int
>         divide x y z = flat $ division <$> (division x y) <*> pure z
>
>         flat :: Either a (Either a b) -> Either a b
>         flat = either Left id 

```

Observe how we had to flatten the result. That's a nifty trick that allows you
to chain calculations with `Either`. Also observe how we had to lift `z` into an
`Either` to allow us to `<*>` into the partially applied `division`. (If this
doesn't make much sense, try and write it from scratch and use the compiler to
guide you through the above). Interesting thing about this `flat` is that it
actually is a Monadic property - that is it exists in `Control.Monad` as join -
and in essence it takes two nested monads and flattens them into
one. Refactoring:


```haskell

> calculate3'' :: IO ()
> calculate3'' = do
>     let n = 40
>     putStrLn $ "Please enter a number to divide " ++ show n ++  " by: "
>     y <- readLn :: IO Int
>     putStrLn $ "Please enter a number to divide the result by: "
>     z <- readLn :: IO Int
>     either print print $ divide n y z
>       where
>         divide :: Int -> Int -> Int -> Either String Int
>         divide x y z = join $ division <$> (division x y) <*> pure z

```

The Monad Instance
---

A last thing worth mentioning is that Either is Monadic as well. How do we
leverage this? Let's look at another example.

```haskell

> calculate5 :: Int -> Either String Int
> calculate5 n = do
>     x <- n `divide` 2
>     x `divide` 2
>       where 
>         divide :: Int -> Int  -> Either String Int
>         divide _ 0 = Left "Can't divide by 0"
>         divide x y = pure $ div x y 

```

What we're doing here is leveraging do notation to use Either's Monadic
structure and bind the result of the computation to a temporary `x` which gets
divided again - all while maintaining the purity of the function. If we were to
call `calculate5 0` we would get the `Left` instance while any other call would
return our `Right` result.


End
----

That's it for now, hope you enjoyed it. Do you have any other nifty
`Applicative` tricks. Message me on **Twitter**.

Until next time!

