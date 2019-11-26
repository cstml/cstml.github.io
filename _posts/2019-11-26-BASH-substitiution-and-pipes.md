---
layout: post
title: UNIX comand sequencing and cd ps tips 
---

#Sequencing

Sequencing allows the user to exectue a series of comands one after another

##$(command)

for comand substitution

example:
```
echo 3 $(echo 3)
will output 
33
```

##$((expr))
for arithmetic evaluation 

example:
```
echo $(( $(echo 3) - $(echo 5) ))
will output
-2
```

#Bash range expansion
Range expansion works really nice, and is a powerful concept. For example

```
echo hello{1..10}

outputs 

hello1 hello2 hello3 hello4 hello5 hello6 hello7 hello8 hello9 hello10
```

#Piping

Piping allows the user to use the output of one comand as the input of another
one. 

```
echo hello{1..100} | grep -o hello1
will output
hello1
```
