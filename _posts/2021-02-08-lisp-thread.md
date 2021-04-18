---
theme: post
date:  01-02-2021
title: "CLisp: Thread last - like Clojure"
---

# Thread last - Common Lisp implementation

These days I've been playing with `Clojure` and one macro I really liked was
`->>` which is called `Thread last`. 

## What does it do

Thread last is very cool. In essence it takes the result of your one function
call and threads it in front of another one. Let me show you what I mean

```lisp
(->> 1 
     (+ 2 ) 
     (+ 3 )
     (+ 4 )) ; -> 10
```

And the more explicit  version of it

```lisp
(->> 1       ; let's call it X to see it
     (+ 2 )  ; this gets transformed to (+ 2 X), let's call the result of this Y
     (+ 3 )  ; this gets transformed to (+ 3 Y), let's call the result of this Z
     (+ 4 )) ; this gets transformed to (+ 3 Z)  whic is then equal to 10
```

Pretty cool , because otherwise the operation would have been written as :

```lisp
(+ 4 (+ 3 (+ 2 1)))
```

In this case it is not the worst - but the longer the calls the more complex
the calls the more you would need to read from inside out.

## CLisp doesn't have this

Or at least **yet** CLisp doesn't, I read somewhere that Clisp 21 does. But,
let us have a go at implementing it 

```lisp
(defmacro ->> (var &rest lst)               ; btw, ->> is a valid name in lisp for either a macro or a function or a variable
  (if (cdr lst)                             ; if the lists of other operations is not empty
      `(->> (,@(car lst) ,var) ,@(cdr lst)) ; recursively call the macro 
      `(     ,@(car lst) ,var)))            ; just expand the macro and be done with it
```

So what the above macro is recursively create the call. Let's run through the
above example step by step to see the macroexpansion 

---

### Step by step Macroexpansion

#### Step 0 - The call itself

```lisp
(->> 1
     (+ 2)
     (+ 3)
     (+ 4))
```

or inline it would be 

```
(->> 1 (+ 2) (+ 3) (+ 4))
```

#### Step 1 - The first macro-expansion

```
(->> (+ 2 1) (+ 3) (+ 4))
```

So we see, the macro takes the first element of the list and the first element
of the arguments and places the it at the end of this call. Then it recursively
calls itself again.

#### Step 2 - The first macro-expansion (again)

```lisp
(->> (+ 3 (+ 2 1)) (+ 4))
```

It treates (+ 2 1) as it treated 1 and it appends it to the `car` of the opperation list

#### Step 3 - You guessed it, the first macro-expansion (again) 
But this time it is the second branch of the if

```lisp
(+ 4 (+ 3 (+ 2 1)))
```

#### Step 4 - Rejoice

... and marvel, at how easy it was to implement the feature of `clojure` in
`common lisp` using a simple recursive `macro`. 
