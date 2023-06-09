# Week 7: Advanced List Operations

## List Reduce

The `List` module contains a number of useful functions for working with lists.  You can find the documentation for the `List` module [here](https://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html).

Lets look at the `List.reduce` functions:

### `List.fold_left`

Fold left is a function that takes a reducer function, an initial value, and a list.  It then applies the reducer function to each element of the list, starting with the initial value, and
then *eating* itself through the list from left to right.

It works just like the `Stream.reduce` function in Java

```ocaml
# List.fold_left (fun acc x -> acc + x) 0 [7; 8; -9; 10];;
- : int = 16
```

If we split up the steps we get something like this:

| list | | 7 | 8 | -9 | 10 |
| --- | --- | --- | --- | --- | --- |
| fold_left | acc | l[0] | l[1] | l[2] | l[3] |
| | **0** | 7 | 8 | -9 | 10 |
| | | 7 | 8 | -9 | 10 |
| | | | 15 |  -9 | 10 |
| | | | | 6 | 10 |
| | | | | | **16** |

In each step we combine the accumulator with the next element in the list, and then use that as the accumulator for the next step.

It is called `fold_left` because it implicitly groups the elements of the list from left to right.

$$
\begin{aligned}
list&=[7, 8, -9, 10]\\
fold\_left(f, 0, list) &= f(f(f(f(0, 7), 8), -9), 10)
\end{aligned}
$$

### `List.fold_right`

`List.fold_right` is similar to `List.fold_left` except that it groups the elements of the list from right to left.

It has a different type signature than `List.fold_left`:

```ocaml
# List.fold_right (fun x acc -> acc + x) [7; 8; -9; 10] 0;;
- : int = 16
```

| list  | 7 | 8 | -9 | 10 | |
| --- | --- | --- | --- | --- | --- |
| fold_right | l[0] | l[1] | l[2] | l[3] | acc |
| | 7 | 8 | -9 | 10 | **0** |
| | 7 | 8 | -9 | 10 |  |
| | 7 | 8 | 1 |  |  |
| | 7 | 9 |  |  |  |
| | **16** |  |  |  |  |

$$
\begin{aligned}
list&=[7, 8, -9, 10]\\
fold\_right(f, list, 0) &= f(7, f(8, f(-9, f(10, 0))))
\end{aligned}
$$
