# Week 8: Lazy Lists

A lazy list is a list that is not fully evaluated until it is needed. This is
useful for representing infinite lists, or lists that are too large to fit in
memory.

Examples of infinite lists include the list of all natural numbers, the list of
all prime numbers, and the list of all Fibonacci numbers.

## Lazy lists in OCaml

One way to implement lazy lists in OCaml is to use the `Lazy` module. But we are going to define our own lazy list type, which we will call `'a llist`.

```ocaml
type 'a llist = Cons of 'a * (unit -> 'a llist)
```

This type definition is a bit tricky. It says that a lazy list consists of a value of type `'a` and a function that returns another lazy list. The function is called a _thunk_. It is a function that takes no arguments and returns a lazy list. The thunk is used to delay the evaluation of the tail of the list.

Here is an example of a lazy list of natural numbers:

```ocaml
let rec from n = Cons (n, fun () -> from (n + 1))
```

It basically says that the lazy list `from n` consists of the value `n` and a thunk that returns the lazy list `from (n + 1)`.

Here is an example of a lazy list of Fibonacci numbers:

```ocaml
let rec fib_step a b = Cons (a, fun () -> fib_step b (a + b))
```

The parameters `a` and `b` are the two previous Fibonacci numbers. The lazy list `fib_step a b` consists of the value `a` and a thunk that returns the lazy list `fib_step b (a + b)`. Of course, the first two Fibonacci numbers are 0 and 1, so we can define the lazy list of all Fibonacci numbers as follows:

```ocaml
let fib = fib_step 0 1
```

This list is infinite, but since its generation is lazy, we can still make use of it.

## Partial Application

Functions in OCaml are curried by default. This means that a function that takes two arguments is actually a function that takes one argument and returns a function that takes another argument. For example, the function `(+)` is defined as follows:

```ocaml
let (+) x y = x + y
```

This is equivalent to the following definition:

```ocaml
let (+) = fun x -> fun y -> x + y
```

The function `(+)` takes one argument `x` and returns a function that takes another argument `y` and returns the sum of `x` and `y`.

We can partially apply a function by passing it only some of its arguments. For example, we can define a function `inc` that adds 1 to its argument as follows:

```ocaml
let inc = (+) 1

let x = inc 5
# val x : int = 6
```

The List module defines a function `map` that takes a function `f` and a list `xs` and returns a list of the results of applying `f` to the elements of `xs`. We can partially apply `map` to define a function `double` that doubles all the elements of a list:

```ocaml
let double = List.map (( * ) 2)

let xs = double [1; 2; 3]
# val xs : int list = [2; 4; 6]
```

Also the `inc` function defined above can be used with `map`:

```ocaml
let xs = List.map inc [1; 2; 3]
# val xs : int list = [2; 3; 4]
```

Which is equivalent to:

```ocaml
let xs = List.map ((+) 1) [1; 2; 3]
# val xs : int list = [2; 3; 4]
```
