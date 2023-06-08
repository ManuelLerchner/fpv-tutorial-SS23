# List Module

## Lists in OCaml

Lists in ocaml are basically linked lists. They are defined as follows:

```ocaml
let my_list = [1; 2; 3; 4; 5]
```

Since they are linked lists, you don't have direct access to the elements in the list. You can only access the head and the tail of the list. The head is the first element in the list and the tail is the rest of the list. The head is an element and the tail is a list. The tail can be an empty list.

```ocaml
let my_list = [1; 2; 3; 4; 5]

let head = List.hd my_list (* head = 1 *)
let tail = List.tl my_list (* tail = [2; 3; 4; 5] *)
```

Since Linked lists are recursive in nature, most of the functions that operate on lists are recursive. For example, the length function is defined as follows:

### Example Length

```ocaml
let rec length l =
  match l with
  | [] -> 0
  | _ :: xs -> 1 + length xs
```

+ This basically means that the length of list $l=\underbrace{[a_1, a_2, \ldots, a_n]}_{\text{list}}$ can be recursively defined as
  + $\text{length}(\underbrace{[a_1, a_2, \ldots, a_n]}_{\text{l}})=1 + \text{length}(\underbrace{[a_2, \ldots, a_n]}_{\text{tail l}})$.

+ Since we need a base case for the recursion, we define the length of an empty list to be 0.
  + $\text{length}([]) = 0$.

Many other functions on lists are defined recursively. For example, the reverse function is defined as follows:

## Binary Search Tree

### Binary Search Tree in OCaml

A binary search tree is a binary tree where the value of the left child is less than the value of the parent and the value of the right child is greater than the value of the parent. The following is an example of a binary search tree:

```ocaml
type tree =
  | Empty
  | Node of int * tree * tree

let my_tree =
    Node(6,
      Node(3,
        Node(1, Empty, Empty),
        Node(4, Empty, Empty)
      ),
      Node(8,
        Node(7, Empty, Empty),
        Node(9, Empty, Empty)
      )
    )
```

The Tree type is defined as follows:

```ocaml
type tree =
  | Empty
  | Node of  int * tree * tree
```

This means that a tree is either an empty node or a node with a left subtree, a value and a right subtree. The left and right subtrees are also trees. The value is an integer.

The syntax `Node of int * tree * tree` means that the constructor `Node` takes three arguments. The first argument is an integer and the second and third arguments are trees. The result of the constructor is a value of type tree.

Since Binary Search trees are again recursive in nature, most of the functions that operate on them are recursive. For example, the function `insert` is defined as follows:

#### Example Insert

```ocaml
let rec insert v t =
  match t with
  | Empty -> Node(v, Empty, Empty)
  | Node(y, l, r) ->
    if v < y then
      Node(y, insert v l, r)
    else if v > y then
      Node(y, l, insert v r)
    else
      t
```

It takes a value `v` and a tree `t` and returns a new tree with the value `v` inserted into the tree `t`. If the value `v` is already present in the tree `t`, then the same tree `t` is returned.

It works as follows:

+ If the tree is empty, then the value `v` is inserted into the tree as the root node.

+ If the tree is not empty:
  + If the value `v` is less than the value of the root node, then the value `v` is inserted into the left subtree.
  + If the value `v` is greater than the value of the root node, then the value `v` is inserted into the right subtree.
  + Else nothing is done and the same tree is returned.

As you can see from this example, it is not possible to change the value of a node in a tree. This is because the tree is *immutable*.

If you want to change the value of a node, you have to create a new tree with the new value.

This means, that if we need to insert a value in the right subtree of a node, we have to create a completely new tree with the new value inserted, and then replace the right subtree of the node with the new tree.

At first this seams unnecessary and inefficient, but in practise it is not that big of a deal. This is because the compilers of functional programs are in general very good at optimizing the code, since they can make more assumptions about the code due to the functional nature of the language. This means that the compiler can do a lot of optimizations that are not possible in imperative languages.
