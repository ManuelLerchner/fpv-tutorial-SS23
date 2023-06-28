open LibIntStringMap

let my_map = IntStringMap.empty

(* Insert *)
let my_map = IntStringMap.set 1 "one" my_map
let my_map = IntStringMap.set 2 "two" my_map
let my_map = IntStringMap.set 3 "three" my_map

(* Read *)

let list = IntStringMap.to_list my_map

(* val list : (int * string) list = [(1, "one"); (2, "two"); (3, "three")] *)
let string = IntStringMap.to_string my_map

(* val string : string = "{ 1 -> \"one\", 2 -> \"two\", 3 -> \"three\" }" *)
