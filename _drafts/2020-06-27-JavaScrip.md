---
title: JavaScrip
date: 2020-06-27
tags: web-dev
---



| `=>`    | Arrow function | Shortens the declaration of a function. |                                                              |
| ------- | -------------- | --------------------------------------- | ------------------------------------------------------------ |
| `.then` |                | Chain instructions.                     | https://stackoverflow.com/questions/3884281/what-does-the-function-then-mean-in-javascript |
|         |                |                                         |                                                              |
|         |                |                                         |                                                              |

## Arrow Function

```javascript
hello = function()
{
	return "Hello World";
}
```

Can be written as 

```javascript
hello = () => {
    return "Hello World";
}
```

Furthermore if the function returns one parameter only it can be further shortened

```javascript
hello = () => "Hello World";
```

#### With a parameter

```javascript
hello = (var) => {
	return "Hello World" + var;
}
```

In fact if there is only one parameter the parenthesis can be dropped

```javascript
hello = var => "Hello World " + var;
```

### .then

Chains `promise` commands and chooses what to do if it fails or succeeds

```javascript
xhrCall()
  .then(S1, E1) //P1
  .then(S2, E2) //P2
  .then(S3, E3) //P3
```

In the above example upon `xhrCall()` 

#### How to trigger the next promise handler

**If we want to trigger the success handler for the next promise in the chain, we can just return a value from the success or the error handler**

**If, on the other hand, we want to trigger the error handler for the next promise in the chain, we can do that using a `deferred` object and calling its `reject()` method**