type ('k, 'v) database = 'k -> 'v option

(* Define a Databse, with x²+1 as base case *)
let (my_database : (int, int) database) = fun x -> Some ((x * x) + 1)

(* Methods *)
let is_empty _ = failwith "impossible"
let get (key : 'k) (db : 'k -> 'v option) = db key

let put (key : 'k) (value : 'v) (db : 'k -> 'v option) x =
  if x = key then Some value else db key

let contains_key (key : 'k) (db : 'k -> 'v option) = get key db <> None

let remove (key : 'k) (db : 'k -> 'v option) x =
  if x = key then None else db key

let keys _ = failwith "inpossible"
let values _ = failwith "inpossible"

(* Example *)

(* the databse will return Some (x*x)+1 for all queries at this point *)
let get_some_value = get 3 my_database
(* will return Some 10 *)

let my_database = put 0 (-1) my_database
(* updates the databse to answer *)
(* if we query 0 we now get -1 as the answer *)

let my_database = remove 8 my_database
(* deletes the entry for 8 *)
(* now querying 8 will return in None *)
