---
layout: post
title: "C++ Ternary Opperators"
---
# Ternary Opperator
Whilst workin on LeetCode I came across this concept which made the whole process a lot more efficient and streamlined.

Thus instead of writing :
```
if (a)
    sum +=a;
if (b)
    sum +=b;
```

One can simply write: 

```
sum += ( a ? a : 0) + (b? b : 0);
```

## How it works?
```
condition ? true : false
```

Cool and simple.
