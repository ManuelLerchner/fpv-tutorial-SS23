open Lib

let a = Math.fact 10
let b = Math.fib 10

(* print *)
let _ = print_endline ("the value of 10! is: " ^ string_of_int a)
let _ = print_endline ("the value of 10th fib is: " ^ string_of_int b)
