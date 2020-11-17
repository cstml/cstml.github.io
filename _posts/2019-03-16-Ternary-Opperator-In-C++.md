---
layout: post
title: "c++: ternary opperators"
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
-or second case-
```
if(l1)
{
        node-> val += l1->val;
        l1=l1->next;
}

if(l2)
{
        node-> val += l2->val;
        l2=l2->next;
}
node -> val += trail;
```
One can simply write: 

```
sum += ( a ? a : 0) + (b? b : 0);
```
-or second case-
```

    node-> val += (l1 ? l1->val : 0) + (l2 ? l2->val : 0);
```

## How it works?
```
condition ? true : false
```

Cool and simple.
