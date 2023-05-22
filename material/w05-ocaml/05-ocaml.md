# OCaml

## Basic Syntax

### Comments

```ocaml
(* This is a comment *)
```

### Variables

```ocaml
let x = 1;;
```

### Functions

```ocaml
let f x = x + 1;;
let succ: int -> int = fun x -> x + 1;;
```

### Tuples

```ocaml
let x = (1, true);;
```

### Lists

```ocaml
let x = [1; 2; 3];;
let y = 1 :: 2 :: 3 :: [];;
```

### Records

```ocaml
type person = { name: string; age: int };;
let x = { name = "John"; age = 42 };;
let name = x.name;;
```

### If-then-else

```ocaml
let x = if 3 < 6 then "1" else "2";;
```

### Pattern Matching

```ocaml
let x = match 3 with
  | 1 -> "1"
  | 2 -> "2"
  | _ -> "else";;
  
let y = match "up" with
    | "up" -> (0, 1)
    | "down" -> (0, -1)
    | "left" -> (-1, 0)
    | "right" -> (1, 0)
```

## Example Programs

### Advanced Hello World

```ocaml

let welcome_string = "lmaCO ot emocleW ,!dlroW olleH"

let rec char_iterator sentence =
  if sentence = "" then ()
  else
    let head = String.get sentence 0 in
    let tail = String.sub sentence 1 (String.length sentence - 1) in
    char_iterator tail;
    print_char head

(* Call Function: Result will be visible in the console when loaded via utop *)
let _ = char_iterator welcome_string
```

## Debuging OCaml

### Using the `#use` command in `utop`

This method works best for single files containing the code you want to debug.
The `#use` command works by just copy-pasting the entire
content of the file into the `utop`-environment. It also shadows previous definitions of variables and functions.

1. Enter into the `root`-directory of the project and run `dune build` to initially build the project.

    ```ocaml
    dune build
    ```

2. Open `utop` via `dune utop src`

    ```ocaml
    dune utop src
    ```

    In all projects you will encounter, dune is configured in a way that will allow this command to work.

    This will open `utop` with the project's `src`-directory as the current working directory.

3. Reload the files

    + Instead of closing and reopening `utop` every time you change something in the files, you can use the `#use` command to load the files again.

    + But you need to be careful, because older definitions may still be around after reloading the file.

    ```ocaml
    #use "src/main.ml";;
    ```
