---
theme: post
date:  03-05-2021
title: "Haskell: Monoids"
---
(*Edited: 7-05-2021*)
# Monoids

Coming from the world of algebra, a monoid is a :
- semigroup with an identity, which is a:
  - magma with associativity, which is a:
    - closed set, with a binary operation which is closed under it
    
*So what?*

Well believe it or not, Haskell defines a Monoid as a `Typeclass`, that lets you
do funky stuff. **Great!**

Let's have a go and demonstrate these funky useful stuff.


## Use case 

Say we have a parser that takes a list or stream of numbers and checks if any of
them are any of the following:

1) odd 

2) divisible by 4 

3) divisible by 6

... (you can carry on imagining adding rules here)


### First Solution

The first solution would be pretty straight forward:

```haskell
s1 = [2,4,5,7,5,3] -- this one checks
s2 = [1,1,1,1,1,1] -- this one doesn't

check :: [Int] -> Bool
check []      = False
check (x:xs)  =  odd x  || x `mod` 4 == 0 || x 'mod 6 == 0 || check xs

``` 

That's all nice and tidy, but say you wanted to add another test - it can be a
bit annoying to chain another `|| test x` to the previous expression. So what
else can we do?


### Second Solution

Well, we can make an observation that all the functions:

1) are of the type `Int -> Bool`,

2) we have a list of `[Int]`,

3) our type is `check :: [Int] -> Bool`.


So in essence we need a way to take a list of `[Int->Bool]` tests, and map them
to `[Int]`. Then we flatten the list, and repeat until we get to the end of the
list of [Int] or we get `True` after we flatten.

```haskell

check' :: [Int] -> Bool
check' []      = False
check' (x:xs)  = foldl1 (||) ( map ($x) tests) || check' xs
  where
    tests = [ t1, t2, t3 ]
    t1 = odd
    t2 = \x -> x `mod` 4 == 0
    t3 = \x -> x `mod` 6 == 0
```

And realistically, even this form, if we look at the recursivity of `check'` we can
improve by observing that `check'` is very much a `map`.

```haskell
check'' :: [Int] -> Bool
check'' = foldr1 (||) . map (\x -> foldl1 (||) ( map ($x) tests))
  where
    tests = [ t1, t2, t3 ]
    t1    = odd
    t2    = \x -> x `mod` 4 == 0
    t3    = \x -> x `mod` 6 == 0
```

Ok, I know what you are thinking, that might not be the nicest section ever, but
Haskell allows use to make it nicer by taking that aux function and declaring it
as such:


```haskell
check'' :: [Int] -> Bool
check'' = foldr1 (||) . map aux
  where
    aux x = foldl1 (||) (map ($x) tests)
    tests = [ t1, t2, t3 ]
    t1    = odd
    t2    = \x -> x `mod` 4 == 0
    t3    = \x -> x `mod` 6 == 0
```

### Option 3 

Ok so we've done it in a more flexible way, but where does the **monoid** come
into play. Well if we remember the properties from the introduction and we have
a look in ghci at the `:info Monoid` we find out a few things. From `Semigroup
typeclass` we get:

1. We have a function `mappend` that has the type signature `Semigroup a => a ->
   a -> a`. So what this does is takes two elements, applies the monoids
   operation and returns the result.

2. We have this other function `mconcat` with the signature `Semigroup a => [a]
   -> a`. This one takes a list of elements and flattens it with the binary
   operation.

3. We find out that `[a]` (so any list) is a `monoid`.

4. We find out about the existence of `All` and `Any` two `Monoids`. When we
   look at their `info: All` and `info: Any` we find out that they are a 
   `newtype Any = Any {getAny :: Bool}`. Nice!

So let's try and get these to work for us. 

Let's start by defining our tests as higher order monoids first:

```haskell
newtype Tester a = Tester {getTest :: a -> Any}
instance Semigroup (Tester a) where
  f1 <> f2 = Tester $ \x -> (getTest f1) x <> (getTest f2) x

instance Monoid (Tester a) where
  mempty = Tester (\x -> Any False)
```

Awesome, the type checks (that's a good hint that the rules might be good) and
we can also see that the Monoid laws hold(left as an exercise for the
reader). Also by using the Monoid `Any` in the type signature we know we can
further flatten it. So our function now becomes a lot clearer/cleaner, and
nicer:

```haskell
check''' :: [Int] -> Bool
check'''   =  getAny . mconcat . map aTests
  where
    aTests = mconcat $ map (getTest . Tester) lstT
    lstT  :: [(Int -> Any)]
    lstT   = [t1,t2,t3]
    t1     = \x -> Any $ odd x
    t2     = \x -> Any $ x `mod` 4 == 0
    t3     = \x -> Any $ x `mod` 6 == 0
```

And now let's transform those tests into sections, as they read nicer:

```haskell
check'''' :: [Int] -> Bool
check''''  =  getAny . mconcat . map aTests
  where
    aTests = mconcat $ map (getTest . Tester) lstT
    lstT  :: [(Int -> Any)]
    lstT   = [t1,t2,t3]
    t1     = Any . odd 
    t2     = Any . (==0) . flip mod 4 
    t3     = Any . (==0) . flip mod 6 
```

And as suggested [here](https://twitter.com/BartoszMilewski/status/1390354033559232514) (thank you for the suggestion) we can further neaten it by using the *infix notation*:

```haskell
check  :: [Int] -> Bool
check = getAny . mconcat . map aTests
  where
    aTests = mconcat $ map (getTest . Tester) lstT
    lstT  :: [(Int -> Any)]
    lstT   = [t1,t2,t3]
    t1     = Any . odd 
    t2     = Any . (==0) . `mod` 4 
    t3     = Any . (==0) . `mod` 6 
```


We can extend this type of manipulation to most monoids, and internalising the
rules and general capabilities are pretty awesome. 


### Further Reading 

- [wiki.haskell](https://wiki.haskell.org/Monoid)


Roger out!

