
(* A polynomial is represented by its coefficients *)
(* Example: 2x^3 - 3x + 1 is represented by [2.0; 0.0; -3.0; 1.0] *)
type polynomial = float list;;

(* 2x^3 - 3x + 1 *)
let my_poly:polynomial = [2.0; 0.0; -3.0; 1.0] 


(* evaluates a polynomial at a given point *)
let evaluate (p:polynomial) (x:float) : float =
  let y = List.fold_left (fun acc c -> acc *. x +. c) 0.0 p in
  y

(* calculates the derivative of a polynomial *)
let derivative (p:polynomial) : polynomial =
  let rec derivative_helper (p:polynomial) (n:int) : polynomial =
    match p with
    | [] -> []
    | x::[] -> []
    | h::t -> (float_of_int n) *. h :: derivative_helper t (n-1)
  in
  derivative_helper p (List.length p - 1)

(* Do some fun stuff *)

(* Recursively iterates the newton method until the difference between the
 * current and previous x is less than epsilon *)
let newton (p:polynomial) (x0:float) (epsilon:float) : float =
  let derivative_p = derivative p in
  let rec newton_helper (p:polynomial) (x0:float) (epsilon:float) : float =
    let x1 = x0 -. (evaluate p x0) /. (evaluate derivative_p x0) in
    if abs_float (x1 -. x0) < epsilon then x1
    else newton_helper p x1 epsilon
  in
  newton_helper p x0 epsilon

