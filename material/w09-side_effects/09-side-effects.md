# Week 9: Side Effects, Units and Exceptions

## Side Effects

In functional programming, side effects are a way of interacting with the outside world. For example, printing to the screen, reading from a file, or reading from the keyboard are all side effects. They are called side effects because they happen outside of the control of the program. In other words, the program cannot control when the user types something on the keyboard, or when the user clicks the mouse, or when data arrives from the network.

This also means that repeated calls to a function with side effects may produce different results. For example, if a function reads from the keyboard, then each time it is called, it may read a different value. This is in contrast to a function that does not have side effects, which will always return the same value when called with the same arguments. Those so called `pure` functions are the ones we have been writing so far.

Side effects are not necessarily bad. In fact, they are necessary for a program to be useful. However, they do make it harder to reason about the program. For example, if a function has side effects, then it is not enough to look at the function to understand what it does. You also need to know what side effects it has. This is in contrast to a pure function, which you can understand just by looking at the function itself.

### Example File IO

Let's look at an example of a function with side effects. The following function reads the first line of a file and returns it as a string.

```ocaml
let read_file (filename : string) : string =
  let ic = open_in filename in
  let row = input_line ic in
  close_in ic;
  row
```

This function has side effects because it reads from a file. It is not a pure function because it does not always return the same value when called with the same arguments.

Writing to a file works similarly. The following function writes a string to a file.

```ocaml
let write_file (filename : string) (row : string) : unit =
  let oc = open_out filename in
  output_string oc row;
  close_out oc
```

## Exceptions

Exceptions are a way of handling errors. They are called exceptions because they are exceptional. They may occur in the normal course of a program, but they are not expected to occur. For example, if a function reads from a file, then it may fail if the file does not exist. This is an exceptional case because the file is expected to exist.

But sometimes we want exceptions to occur. For example if we read to the end of a file, then we want to know that we have reached the end of the file. Ocaml has a special exception for this case called `End_of_file`. We can use this exception to detect when we have reached the end of a file.

```ocaml
let rec read_file (filename : string) : string list =
  let ic = open_in filename in
  let read_loop () =
    try
      let row = input_line ic in
      row :: read_loop ()
    with End_of_file ->
        []
    in
    let result = read_loop () in
    close_in ic;
    result
```

The function `read_file` reads all the lines of a file and returns them as a list of strings.
