# Debugging OCaml

## Different ways to debug OCaml

1. Enter into the `root`-directory of the project and run `dune build` to initalize the project.
2. Open `utop` via `dune utop`
3. Load the file you want to debug via the `#use` command (e.g `#use "src/main.ml";;` )
    + All the content of the file will be loaded into the `utop`-environment
    + Variables and functions are now available in the `utop`-environment
    + To reload the file, use `#use "src/main.ml";;` again
