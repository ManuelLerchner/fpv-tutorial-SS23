open LibPrintable
open LibOrderedPrintable
open LibMap

module BinaryTreeMap =
functor
  (K : OrderedPrintable)
  (V : Printable)
  ->
  struct
    type key = K.t
    type value = V.t
    type t = Empty | Node of key * value * t * t

    let empty = Empty

    let rec to_list = function
      | Empty -> []
      | Node (k, v, l, r) -> to_list l @ ((k, v) :: to_list r)

    let rec set k v = function
      | Empty -> Node (k, v, Empty, Empty)
      | Node (k', v', l, r) ->
          let diff = K.compare k k' in
          if diff < 0 then Node (k', v', set k v l, r)
          else if diff > 0 then Node (k', v', l, set k v r)
          else Node (k', v, l, r)

    let rec get_opt k = function
      | Empty -> None
      | Node (k', v, l, r) ->
          let diff = K.compare k k' in
          if diff < 0 then get_opt k l
          else if diff > 0 then get_opt k r
          else Some v

    let get k m =
      Option.fold
        ~none:(fun _ -> raise Not_found)
        ~some:(fun x _ -> x)
        (get_opt k m) ()

    (* let rec clear k = function Empty -> Empty
       | Node (k', v, l, r) ->
         let rec remove_max = function Empty -> failwith "unreachable"
           | Node (k, v, l, Empty) -> k, v, l
           | Node (k, v, l, r) -> let k', v', r' = remove_max r in k', v', Node (k, v, l, r')
         in
         let diff = K.compare k k' in
         if diff < 0 then Node (k', v, clear k l, r)
         else if diff > 0 then Node (k', v, l, clear k r)
         else if l = Empty then r
         else let max_k, max_v, max_l = remove_max l in
           Node (max_k, max_v, max_l, r) *)

    let to_string m =
      List.map
        (fun (k, v) -> K.to_string k ^ " -> " ^ V.to_string v)
        (to_list m)
      |> String.concat ", "
      |> fun s -> "{ " ^ s ^ " }" (* Printf.sprintf "{ %s }" *)
  end
