let rec fib = function 0 -> 1 | 1 -> 1 | n -> fib (n - 1) + fib (n - 2)

let rec fact = function 0 -> 1 | n -> n * fact (n - 1)