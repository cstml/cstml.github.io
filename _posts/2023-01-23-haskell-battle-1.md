---
layout: post
title:  "Haskell: free vs freer vs tagless final #1"
date:   2022-11-29
categories: haskell
tags: haskell Educational edsl monad
---
# Free vs Freer Vs Tagless Final in Haskell — #1 Scenario & Transformers

> The battle of the decouplers.

![No, not these transformers.](https://cdn-images-1.medium.com/max/800/0*RS_RpMcdLl4Q_1oE)

Photo by [Robert Linder](https://unsplash.com/@rwlinder?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com?utm_source=medium&utm_medium=referral)

#### Pre-Intro

Hi, this article is the first of a series showing the same domain problem being modelled with different techniques, I will link the following articles here as they get published:

- [#1 Scenario & Transformers (you are here)](/haskell/2022/11/29/haskell-battle-1.html)
- #2 Free (TBC)
- #3 Freer (TBC)
- #4 Tagless Final (TBC)

#### Intro

Hello, I’ve been wanting to make a post about these Haskell techniques for modelling domain logic and decoupling it from implementation for a while.

This was mostly motivated by the fact that I really like the three (Free, Freer, Tagless Final), but never found an article showing them used side by side, in comparison to a Transformers based implementation. I will try to highlight the pros and cons of each approach, and hopefully by the end you will be able to use whichever technique you deem fit for fun and profit.

So without much further ado let’s jump straight into it.

#### **The Domain**

A thread that connects the three techniques is their purpose. All three are useful techniques for modelling the domain of our problem while abstracting (to be read as omitting) the implementation. Let us take a hypothetical domain and exemplify what we mean by this; so let us write a quick scenario:

#### The Scenario

> Let us imagine we were tasked to implement a very basic calculator. Management together with the design team names this project **BCalc** (sometimes referred to as **BC** because it is incredibly catchy). Being super innovative **BCalc** allows us to:

> 1. Add an _Int_ to our result previous result;

> 2. Subtract an _Int_ from our result;

> 3. Retrieve our result, print it to screen together with some “wicked” prompt;

Up until now it all makes a lot of sense, but to fully grasp the power of the system we will also append to our above scenario a few more lines, which highlight the flexibility of our approach:

> At a (much) later date (and close to the deadline), management, together with the client, decide that they would also like to be able to feed a function to **BC**, which modifies the last result. They have very, (very), high plans for **BCalc** — maybe even adding some AI functions to it (mostly because it sounds cool).

#### The Transformers based implementation

Ok, so you know Haskell, you’ve read about [Monad Transformers](https://hackage.haskell.org/package/transformers) (not the [Transformers](https://en.wikipedia.org/wiki/Transformers) franchise), and you realise that you can model **BCalc** with the use of the **StateT** monad transformer, on top of **IO**. So you get to work and produce the following unique and innovative piece of _Intellectual Property_ that will bring you fame and fortune:

```haskell
import Control.Monad.State

-- The type of our Programs  
type Program a = StateT Int IO ()

-- Adds an Integer to the last result  
adds :: Int -> Program ()  
adds x = modify (x +)

-- Subtracts an Integer to the last result  
subtracts :: Int -> Program ()  
subtracts x = modify $ flip (-) x

-- Prints the result in the best marketed way possible  
printsResult :: Program ()  
printsResult = get >>= \r -> liftIO $ putStrLn ("BC> " <> show r)

-- This is how easy it is to write Programs for BC  
exampleProgram :: Program ()  
exampleProgram = do  
  adds 2  
  adds 3  
  printsResult  
  subtracts 3  
  printsResult
```

You’ve done it (colleagues admire your cunning). Now you can share with management your Transformer based EDSL, and they can have fun writing many (many, many) programs using your exposed API to your **Program** monad. Because you are kind, you also surface to them a function that runs **BC** programs written in your EDSL. In a spur of inspiration you name it **runProgram.**

```haskell
-- Run this to experience BC  
runProgram :: Program a -> IO a  
runProgram = flip evalStateT 0
```

Equipped with **runProgram** and **exampleProgram**, every one spends endless hours of fun writing (and nicely printing) computations that they never even imagined. Like so:

```haskell
λ> runProgram exampleProgram  
BC> 5  
BC> 2
```

Storms gather when management tell you about the addition of the new feature they’ve decided to add to **BC** (just as you were finishing your ☕️ break, _always …_). But you are well equipped with perseverance and patience, and diligently go back to work and produce the following missing utility, unlocking the full potential of **BC.**

```haskell
-- Applies a function to last result  
appliesFunction :: (Int -> Int) -> Program ()  
appliesFunction = modify
```

Now you can rest at ease, as people can extend **BC** with unfathomed rich functions — as seen in the following example:

```haskell
-- the answer to the Ultimate Question of Life, the Universe, and Everything.  
applyTheAnswer :: Program ()  
applyTheAnswer = appliesFunction (const 42)

exampleProgram2 :: Program ()  
exampleProgram2 = do  
  adds 2  
  adds 3  
  printsResult  
  subtracts 3  
  printsResult  
  applyTheAnswer   
  printsResult
```

You can now rest at ease; your colleagues can see why when running:

```haskell
λ> runProgram exampleProgram2  
BC> 5  
BC> 3  
BC> 42
```

#### So?

Okay, so what is “_wrong”_ with the above approach? You’ve ended up with a nice abstraction over **BC** that allows people to write programs with your provided API, it is easy to extend and you’ve successfully delivered your product. The answer is: “_nothing”_ is fundamentally wrong with this approach, and it is very trivial to work with and implement.

BUT, on the other hand, there are some issue that I would like to mention, and those are:

> There is no decoupling between the business logic of **BC** and its implementation.

In essence there is no way for us to look at a **BC** program and dump its sequence of instructions. Of course, we could add some more transformers on top to keep track of our instructions, or of what we’ve executed up until a point — but that would not be elegant (and we don’t care for stuff which is not elegant).

Imagine having to take our **exampleProgram** or **exampleProgram2** and rewrite them into an intermediary representation where we do fancy optimisations, fusion, and whatnot — we’ve hit an invisible wall. And that is where the decoupling techniques come in handy.

> Every time we added a new feature to **BC** we got caught up in implementing it.

I can hear you saying it, and you are right. I could have replaced the provided **Program ()** implementation with **undefined** and kept it abstract, but that’s not really the point. The point is that, now our **Program** has one way and **one way only** to interpret commands, and that is their implementation. If further down the line you needed to change the interpretation of what each instruction does, you would have to do it there, in the implementation itself. You wouldn’t be able to easily keep two **printsResult** implementations in parallel (one for prototyping, and one that shoots lasers), without adding another function **printsResultAndShootsLasers**.

#### Summary

So to summarise:

- `+` easy to do.
- `+` minimal dependencies.
- `+` fast — _as close to the metal as it gets_.
- `-` inflexible once implemented.
- `-` does not (elegantly) allow manipulation of the program’s AST.

#### Conclusion

The article has introduced the series of short articles on modelling domain specific logic in Haskell. It has also introduced a (silly) problem, and proposed a trivial Transformers based solution to it. Lastly, the article has also tried to highlight the shortcomings of such an approach, and made us curious about how to deal with them.

Until the next time, _may the λ be with you._

### Links
- I originally posted this on [medium](https://medium.com/@cstml/free-vs-freer-vs-tagless-final-in-haskell-1-scenario-transformers-f8bc4495ea7e).
