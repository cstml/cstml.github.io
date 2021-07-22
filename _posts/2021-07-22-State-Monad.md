---
theme: post
date:  22-07-2021
title: "Haskell: State and StateT examples."
---

# A look at the State Monad and StateT Monad Transformer.

Beginning to work with Monads is an important aspect of learning to work with
Haskell. I wanted to add my take on some simple examples to try and add to the
existing ones. So let's have a look.


## Let's say

We have a web app and we need to monitor if a user is logged in or not across
our session, and each of our functions return a result.

## The code 

Firstly we need to import our monad libraries. For this example we will be using:
```haskell
import Control.Monad.IO.Class (liftIO)  -- ^ liftIO allows us to lift the output
                                        -- out of the monad and for example
                                        -- print or read, just like normal IO.

import Control.Monad.Trans.State        -- ^ the bog standard State Monad,
                                        -- together with the StateT Monad
                                        -- Transformer, which allows us to
                                        -- enrich the IO monad with the
                                        -- capabilities of State monad.
```

OK, I will try and comment the text as I go along, but so far so good. Let's now
define our two data types that we will use, based on the above web app
assumptions.

```haskell
data WebsiteResult = OK | Err String       deriving (Show, Eq)
data WebsiteState = LoggedIn | LoggedOut   deriving (Show,Eq)
```

So we know that the Website can return an `OK` or an `Err + String information`
and all the state we want to track is if we are `LoggedIn` or `LoggedOut`. I
hope this is all good until now. Let's now have a look at defining an operation.

```haskell
exOperation :: State WebsiteState WebsiteResult
exOperation = do
  logIn "Password"
  makeTransaction
  printResult
```

Arguably you can read what the `exOperation` does - without seeing the actual
implementation (to which we will get to) of the operations. It first tries to
login by providing a string `"Password"`, then it attempts to make a
transaction, and at the end it prints out the result. We can agree this is very
neat. Furthermore if we look at the type of `exOperation` we can already get an
insight into what it tells us. We read it as: *we are operating with a State
monad that is holding an instance of WebsiteState and at the end we are
returning a WebsiteResult.*

OK now let's have a look at how we would go about implementing these operations.

```haskell
logIn :: String -> State WebsiteState WebsiteResult
logIn password = do
  if password == "Password"  -- | check if it is the password 
    then put LoggedIn        -- | logged in
    else put LoggedOut       -- | logged out
  checkOk                    -- | at the end we check to see what happened

    where
      checkOk :: State WebsiteState WebsiteResult
      checkOk = do
        state <- get
        if state == LoggedIn then return OK else return $ Err "Bad Log In"
```

The first one takes a String, compares it to the (albeit hard-coded here) correct
password. If it likes it, it changes the state to `LoggedIn` by using the `put`
function. If it doesn't then it changes it to `LoggedOut`. At the end I provided
one more monad instance to show how we would change the return. In it we use the
other useful function for the `State` monad, namely `get` which gets the
`WebsiteState` out of the monad. Hopefully you are starting to get the gist of
it, if not let's look further at the other two functions:

```haskell
makeTransaction :: State WebsiteState Bool
makeTransaction = do
  state <- get
  case state of
    LoggedIn -> return True
    LoggedOut -> return False

printResult :: State WebsiteState WebsiteResult
printResult = do
  state <- get
  case state of
    LoggedIn -> pure $ OK
    LoggedOut -> pure $ Err "Hi, enter your good password!"
```

These are mostly identical with the exception of one thing, namely the use of
`pure` instead of `return`. It's worth keeping in mind that both are identical,
and it's mostly to do with defining `Applicative Functor`.

## Running the Monad 

OK so all good, but how do we get the result of running the `exOperation` monad?
Well to do this we need to use `runState :: State s a -> s -> (a, s)` which (as
its type suggests) takes a State Monad and an initial State and returns the
result of the calculation as a tuple of state and result. Perfect so let's do it.

```haskell
result = runState exOperation LoggedOut -- will return (OK,LoggedIn)
```

And if we wanted to get the result only and print it we could simply feed this
to a `fst` in a `IO ()` monad.

```haskell
printOutResult :: IO ()
printOutResult = print $ fst result
```

# But what if ...
But what if we wanted to print out results as we went along, would that be
possible? The answer is yes, but that means that we would need access to an `IO`
monad instance while we are inside the `State` monad, which still behaves as we
would expect `IO` to behave. This is exactly what `StateT` monad is for. Where
`State` would have to have a signature of the type `State Type1 (IO Type2)` we
can see from the signature that we don't have (easy) access to `Type2` - as it
is wrapped inside the `IO` and we cannot reach inside to grab it. `StateT`
allows us to make use of a type looking like `StateT Type1 IO Type2` - hence now
we can make use of both the `State` functions and the `IO` capabilities. Let's
look at the example, which I have annotated to make it easier to follow along.

```haskell
--  If we wanted to combine this behaviour with an IO Monad we would need to use
--  the StateT transformer.

operations :: IO ()
operations = do
  putStrLn "Hello and Welcome to our Operations.\n Please insert your password:"
  pass             <- getLine
  let computation  = logInT pass
  let initialState = LoggedOut
  result           <- runStateT computation initialState
  return ()

-- | Observe how our return actually returns inside the IO Monad but our state
-- is outside of it. This offers us more control than something like "State
-- WebsiteState (IO WebsiteResult)" because we get a shallower version of the
-- monad, and we also get access to the 

logInT :: String -> StateT WebsiteState IO WebsiteResult
logInT password = do
  -- | First thing we get the state
  state <- get
  -- | Then, we check if we are already logged in.
  if state == LoggedIn
    then liftIO $ print "Allready Logged In!"
    else liftIO $ print "You need to sign in"
  -- | Now we get to check the password.
  if password == "Password"           
    then put LoggedIn                 
    else put LoggedOut
  -- | In the end we get the state again to check if the log in was successful.
  state <- get
  case state of
    LoggedIn -> liftIO $ print "Correct Password! Welcome!"
    _ -> liftIO $ print "Bad Password. Denied."
  -- | And at the end end we just return a random Auth Code.
  return OK
```

Worth noting here is that we could have just used `return` or `pure` to lift the
`IO` operation, but the issue here is that it will not print or read it (best
way to understand this would be to try it yourself), hence we need to use
`liftIO` - this way we make sure that the `IO` operations happen as expected. 

## In the end

Hopefully this example helps you use `State` and `StateT` and gives a bit more
insight.

# Other Resources
- [Simple StateT use](https://wiki.haskell.org/Simple_StateT_use)
- [State Monad](https://wiki.haskell.org/State_Monad)
