---
layout: post
title: "build: Makefiles"
date: 2020-06-06
edited: 2020-10-16
tags: [linux]
---
# Makefiles

If you are wondering what the best documentation for Makefiles is
please visit [the official manual](https://www.gnu.org/software/make/manual/make.pdf)

#### What do they do
A **`makefile`** tells **`make`** (which is a separate piece of software) what to
do, and usually these instructions tell make how to compile and build a
    program. They are super useful when you have multi-file projects, but not only.

#### Syntax

```bash
target : prerequisites
    recipe
```
the target and prerequisites use make syntax while the recipe is written in bash
#### A simple example

```
hello: introduce
    @echo Hello World I have an interesting story to tell \
    my name is computer, and I love makefiles
introduce:
    echo "Let me Introduce myself"
```
What the `makefile` above will do is:
1. Want to execute `hello` as it is the first function and will
   look if `introduce` has been satisfied.
2. See that it is not satisfied so it will look for introduce and execute it first
3. execute introduce
4. execute target
5. that's it

Note: 
- can you see how I broke down the first echo with the use of \
- @ character will not output the function being executed but
  rather only the output. It is called suppression.

#### A useful example
Scenario: we have a program *`a.cpp`* that depends on the prior
compilation of *`b.cpp`*, with the latter using the library *`d.h`*

Not only that, but you are also a tidy person, and don't want to
leave any trace of the file executing, so the folder is nice and
clean at the end

Let's have a go at creating this:

```makefile

all: execute clean

compile: a.o b.o 
	@g++ *.o -o output -I .

a.o: b.o 
	@g++ -c a.cpp -I .

b.o: 
	@g++ -c b.cpp -I .

.PHONY : clean

execute: compile
	@./output

clean:
	@echo "cleaning the folder"
	@rm *.o
	@rm output
	@echo "All done "

```

To have a look at what the above mini program does go to my
[exercises repo](https://github.com/cstml/leetcode-exercise-library/tree/master/etc/3-make-file-example)

#### Wildcard rules

If you want to define a rule that is applied to all .foo files when compiled 

```makefile
%.o: %.foo
    fooc $(FOOFLAGS) -o $@ -c $<
```


#### Condensed  useful stuff

| automatic variables                     | look at the example below for more details                   |
| --------------------------------------- | ------------------------------------------------------------ |
| `$@`                                    | This means the file that is being generated - the one on the left of the dots |
| `$<`                                    | First prerequisite - usually the source file                 |
| `$^`                                    | All the prerequisites                                        |
| `$(wildcard *.cpp)`                     | will load all the `*.c` files                                |
| `$(patsubst %.c,%.o,$(wildcard *.cpp))` | Will substitute all the `*.cpp` into `*.o`. Note the use of % to denote EACH |
| `$(shell pwd)`			              | Executes the shell command					|

```makefile
all: library.cpp main.cpp

    $@ evaluates to all 
    $< evaluates to library.cpp
    $^ evaluates to library.cpp main.cpp
```

#### Makefiles are smart

Makefiles are quite smart as well 

```makefile
%.o : %.cpp
#this will generate obj files from all of the cpp files without the need of any other command
```



### Further resources

- http://nuclear.mutantstargoat.com/articles/make/
