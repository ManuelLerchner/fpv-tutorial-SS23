# Debugging OCaml

## Different ways to debug OCaml

### Using the `#use` command in `utop`

1. Enter into the `root`-directory of the project and run `dune build` to initially build the project.

    ```ocaml
    dune build
    ```

2. Open `utop` via `dune utop`

    ```ocaml
    dune utop
    ```

3. Load the file you want to debug via the `#use` command, e.g.

    ```ocaml
    #use "src/main.ml";;
    ```

    + All the content of the file will be loaded into the `utop`-environment
    + Variables and functions are now available in the `utop`-environment
    + To reload the file, use the previous command again. This will shadow the previous definitions of the variables and functions
