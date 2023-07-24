# Week 11: Big Step Semantics

Big step semantics is a way to define the semantics of a programming language by recursively reducing the program-expression to a value. The reduction is done in a top-down manner, starting from the root of the expression tree. The reduction stops when the expression is reduced to a value.

## Big Step for OCaml Expressions

Now we are going to define the big step semantics for OCaml expressions.

### Tuple

A tuple is a sequence of expressions separated by commas and enclosed in parentheses. The big step semantics for a tuple is to evaluate each expression in the tuple in order, and return a tuple of the values of the expressions.

```ocaml
(E1, E2, ..., En) => (V1, V2, ..., Vn)
```

where `E1, E2, ..., En` are expressions, `V1, V2, ..., Vn` are values, and `n >= 0`.

![Tuple Evaluation](material/w11-big_step/images/image1.png)

### List

Lists work similarly to tuples. The big step semantics for a list is to decompose the list into its head and tail, evaluate the head and tail, and return a list with the evaluated head and tail.

```ocaml
H::T => V::W
```

where `H` is an expression, `T` is a list, `V` is a value, and `W` is a list.

![List Evalueation](material/w11-big_step/images/image2.png)

### Global Definition

A global definition is a definition of a value at the top level of a program. The big step semantics for a global definition is to look up the value of the expression, and return its value.

![Global Definition](material/w11-big_step/images/image3.png)

### Local Definition

A local definition is a definition of a value inside a `let` expression. The big step semantics for a local definition is to evaluate the expression, and then substitute the value of the expression for the variable in the body of the `let` expression.

![Local Definition](material/w11-big_step/images/image4.png)

### Function Call

In order to evaluate a function call, we need to evaluate the function expression and the argument expression. Then we substitute the value of the argument expression for the parameter in the body of the function expression.

![Function Call](material/w11-big_step/images/image5.png)

### Pattern Matching

 The big step semantics for pattern matching is to evaluate the expression, and then match the value of the expression with the patterns. If the value matches a pattern, then we substitute the value of the expression for the variable in the body of the pattern.

![Pattern Matching](material/w11-big_step/images/image6.png)

### Built-in Operators

Built in operators cannot be evaluated directly, we need to compose them into their mathematical expressions first. For example, `1 + 2` is composed of the integer `1`, the operator `+`, and the integer `2`. The big step semantics for a built-in operator is to evaluate the expressions in the operator, and then apply the operator to the values of the expressions.

![Built-in Operators](material/w11-big_step/images/image7.png)

## Example

In this example, an expression using recursive functions will be evaluated:

```ocaml
let rec f = fun x -> x + 1
    and s = fun y -> y * y
```

We are going to calculate the value of the expression:

```ocaml
f 16 + s 2
```

![Example Big Step Program](material/w11-big_step/images/image8.png)

Using the rules defined above, we can evaluate the expression and arrive at the value `21`.
