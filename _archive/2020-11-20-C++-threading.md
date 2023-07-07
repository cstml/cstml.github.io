---
theme: post
date: 22-11-2020
title: "c++: threading 1"
---

# C++ Threading

This is a subject that is both very interesting and exciting. I have had a lot
of fun experimenting with it so let's have a look. The best way, off the
bat, is to look at a simple example;

## Example 1: Threading

```c++
#include <iostream>
#include <thread> // for the thread library
#include <unistd.h> // for sleep

int main() {
  auto print = [] (int delay) {
    std::cout<<"thread: "<<delay<<" seconds\n";
    sleep(delay);
    std::cout<<"exiting thread: "<<delay<<" seconds\n";
  };

  std::thread first(print, 4);
  std::thread second(print, 1);

  first.join();
  second.join();

  return 0;
}
```

What is going on here:

- we are defining a lambda function (have a look at my lambda function post for
  more information) called print that has some telling printing capabilities
  and a delay
- we are then starting 2 threads:
  - `first` will take 4 seconds to complete
  - `second` will take 1 seconds to complete

The functionality of thread can then be seen easily in the console output from
running the above:

```
thread: 4 seconds
thread: 1 seconds
exiting thread: 1 seconds
exiting thread: 4 seconds
```

Let's analyse it:

1. `print(4)` and `print(1)` were able to start one after another - `print(1)`
   did not have to wait for `print(4)` to finish before it execute
2. `print(1)` finished before `print(4)` - because simply put, it took less
   time - NOT because of the order of execution

---

## Example 2: not threading

If this seems confusing, let's look at what the above program would have done
without the use of threads:

If we change the body of main with:

```C++
auto print = [] (int delay) {
    std::cout<<"thread: "<<delay<<" seconds\n";
    sleep(delay);
    std::cout<<"exiting thread: "<<delay<<" seconds\n";
    };
  
  print(4);
  print(1);
```

This will output:

```
thread: 4 seconds
exiting thread: 4 seconds
thread: 1 seconds
exiting thread: 1 seconds
```

Let's analyse it:

1. `print(4)` and `print(1)` started and finished in a sequential manner -
   `print(1)` had to wait for `print(4)` to finish before it executed
2. `print(4)` finished before `print(1)` started 

---
## Ways of creating threads 

### The lambda way
The lambda way is the way used in the example, and has a nice modern feel to
it (I also quite like lambda functions, so I am slightly biased). The structure
of this is: 

```C++
std::thread name_of_thread(lambda, arguments);
```

Example:

```c++
//...
auto p = [](int delay){sleep(delay);std::cout<<"simple lambda thread"<<std::endl;};
std::thread first_thread(p,5);
std::thread first_thread(p,4);
std::thread first_thread(p,3);
//...
```



### The "normal" function call way

This is as simple as a calling a normal function or method. Let us adapt the above lambda to a classical call:

```C++
void p (int delay){
  sleep(delay);
  std::cout<<"classic function thread"<<std::endl;
}

void main(){
  std::thread aThread(p,5);
	std::thread bThread(p,4);
	std::thread cThread(p,3);
  //...
}
```



### The callable object way

When I was looking into threading I discovered that you can implement the
operator `()` for a class which allows it to implement calls. This was a great
find, and I will surely do a post on them. But until then, let's look at a
thread implementation of this:

```C++
class thread_obj { 
public: 
	void operator()(int delay) 
  {
    sleep(delay);
    std::cout<<"Callable object thread \n"; 
  } 
}; 

void main(){
  std::thread aThread(thread_obj(),5);
	std::thread bThread(thread_obj(),4);
	std::thread cThread(thread_obj(),3);
  //...
}
```

---
## The `.join()`

As previously seenthe `std::thread` object has a method called `join()` which
indicates that the program should wait for the thread to finish before
continuing . An example:

```c++
std::thread calculator(calc);
//... do stuff WHILE calc function executes
calculator.join(); // wait for calc function to finish
//... do stuff AFTER calc function has finished
```

---
## Conclusion

Hopefully you have a better understanding of how to implement threads in C++.
Now go and build fun projects with them!

We will look into further details about handling threads in a later post. Until
then, have fun, break stuff, and learn.
