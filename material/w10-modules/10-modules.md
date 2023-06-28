# Week 10: Modules

In Ocaml, a module is a collection of types, values, and functions. Modules are used to organize code and to avoid name clashes. Modules can be nested, and they can be parameterized by other modules.

## 10.1 Module Types

A module type is a specification of the types, values, and functions that a module must provide. Module types are used to specify the interface of a module. A module type can be parameterized by other module types.

A module type is defined using the `module type` keyword. For example, the following module type specifies that a module must provide a type `t` and a function `f`:

```ocaml
module type ModType = sig
  type t
  val f : t -> t
end
```

In Java, a module type is similar to an interface with a generic type parameter.

```java
interface ModType<T> {
  T f(T x);
}
```

## 10.2 Module

A Module is a similar to a class in Java. It can also implement a module type. A module can be defined using the `module` keyword. For example, the following module implements the module type `ModType`:

```ocaml
module Mod : ModType with type t = int = struct
  type t = int
  let f x = x + 1
end
```

In Java, a module is similar to a class that implements an interface.

```java
class Mod implements ModType<Integer> {
  public Integer f(Integer x) {
    return x + 1;
  }
}
```

We can call the function `f` in the module `Mod` as follows:

```ocaml
Mod.f 1
(* returns 2 *)
```

## 10.3 Functors

A functor is a function that takes a module as an argument and returns a module. A functor can be defined in the following way:

```ocaml
module Functor (M : ModType with type t = int) : ModType with type t = M.t = struct
  type t = M.t
  let f x = M.f (M.f x)
end
```

This particular functor takes a module of type `ModType` and returns a module of type `ModType`. The returned Module differs from the input module in that the function `f` is applied twice.

It can be used in the following way:

```ocaml
module Mod2 = Functor(Mod)

Mod2.f 1
(* returns 3 , because inc is applied twice*)
```
