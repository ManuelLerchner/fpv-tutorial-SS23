type ('k, 'v) database = ('k * 'v) list

(* Define a an empty databse*)
let (my_database : (int, string) database) = []

(* Methods *)
let is_empty (db : ('k * 'v) list) = match db with [] -> true | _ -> false

let get (key : 'k) (db : ('k * 'v) list) =
  let entry = List.find_opt (fun (k, _) -> key = k) db in
  Option.map (fun (_, v) -> v) entry

let contains_key (key : 'k) (db : ('k * 'v) list) = get key db <> None

let remove (key : 'k) (db : ('k * 'v) list) =
  List.filter (fun (k, _) -> k <> key) db

let put (key : 'k) (value : 'v) (db : ('k * 'v) list) =
  let cleared_list = remove key db in
  (key, value) :: cleared_list

let keys (db : ('k * 'v) list) = List.map fst db
let values (db : ('k * 'v) list) = List.map snd db

(* Example *)
let my_database = put 1 "Hallo" my_database
(* we now inserted (1,"Hallo") *)

(* so we can query this parameter now *)
let value = get 1 my_database

(* we can remove it again *)
let my_database = remove 1 my_database

(* the list is now empty *)
let is_empty = is_empty my_database
