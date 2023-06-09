let squaresum (xs : int list) = List.fold_left (fun acc x -> acc + (x * x)) 0 xs

let float_list (xs : int list) = List.map float_of_int xs

let to_string xs =
  let list_part =
    List.fold_left (fun acc v -> acc ^ string_of_int v ^ ";") "" xs
  in
  "[" ^ list_part ^ "]"

let part_even xs =
  let even, uneven = List.partition (fun x -> x mod 2 = 0) xs in
  even @ uneven
