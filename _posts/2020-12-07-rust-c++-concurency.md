---

layout: post
title: "rust: threading 1 -  a primer"
date: 2020-12-07

---

# Threading

A central idea of rust is that of concurency safety. So let's explore some
parallels in impementation.

First the implementation in Rust:
```rust
use std::thread;

fn main() {
    let mut vec:Vec<i32> = Vec::new();
    for iterator in 0..12 {
        vec.push(iterator.clone());
    }
    let mut handles = vec![];

    for it in 0..10{
        let vec2 = vec.clone();
        handles.push(
            thread::spawn( move || {
                for iterator in vec2.iter(){
                    println!("This is {}  from thread {}", iterator, it);
                }
            })
        );
    }
    for handle in handles{
        let _ = handle.join();
    }
}
```

```c++
#include <iostream>
#include <mutex>
#include <vector>

int main() {

  std::vector<int> vec;

  for ( int i=0; i<=10; i++){
    vec.push_back(i);
  }

  std::vector<std::thread*> handles;
  for (int i=0; i<10; i++){
    handles.push_back(
        new std::thread( [i,vec] {
          for (int it=0 ; it < vec.size(); it++){
            std::cout<<"This is "<<vec[it]<<" from thread "<<i<<std::endl;
          }
        }));
  }

  for (auto handle : handles){
    handle->join();
    delete handle;
  }
  
  return 0;
}
```
Ok, let's point out the differences:
- Alocation of threads 
 - first of all, in c++ we had to alocate and dealocate the threads ourselves.
   For this we had to make use of the heap memory with `new()` and `delete`.
 - in rust pointers get dealocated when they go out of scope, so everything
   which is in the scope of main got dealocated at the end of it

- passing the copy of the `vec` 
 - I am a big fan of how *lambdas* work in C++. They give you a lot of control
   of what you capture inside the lambda, how you capture it (by reference or
   by copy), and what parameters you want the lambda function to receive. This
   allows for a lot of flexibility. In this case I wanted to pass the vector by
   copy to replicate the concurency safety that Rust is achieving. But for this 
   specific case I am aware that the best method would have been to pass it by
   reference as nothing happens to the vector itself inside the loop. At the
   same time passing `i` by copy is the correct thing to do, as you want it to
   become local to your thread.
 - My current implementation is cloning outside the thread and then borrowing
   it inside the thread. In my opinion this is not as elegant as the C++
   implementation, but can't make it work any way else. This is probably a good 

The rest seems pretty similar. What do you think?


