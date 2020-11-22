---
title: "c++: callable objects and templates"
date: 2020-11-22
---

## Callable objects

Callable objects make use of the `()` operator to act in a similar manner to functions. For example

```c++
class Greeter {
public: 
  void operator () () {
    std::cout<<"Hello"<<std::endl;
  }
};
```

Can then be used like so:

```c++
void main(){
  Greeter foo;
  foo();
}
```

There is not much more to it. Have a play and it's quite easy to pick-up. Let's
look at combining ehis with Templates.

---
## Templates

Templates allow us to make use of C++'s polymorphism without having to write
out all the different combinations of functions, methods and types. Instead we
can use the template call to define a method or function based on a generic
class or typename.

Ways of creating tempates:

```c++
template <class identifier> function_declaration;
template <typename identifier> function_declaration;
```

Let's see an example using the above callable class:

```c++
  template <class AType>
  AType operator () (AType val) {
    std::cout
      <<"Thanks for giving me a: "
      <<val
      <<" of type : "
      <<typeid(val).name()<<std::endl;

    std::cout<<"Here, have "<<val<<" back!"<<std::endl;
    return val;
  }
};
```
Now we can call the operator `()` with any type and it will return that
respective type:
```c++
int main() {
  Greeter foo;
  foo();
  int a = foo(2);
  foo("Bla");
  foo('a');
  foo(3.2);
  foo(999999999999999999);
}
```
