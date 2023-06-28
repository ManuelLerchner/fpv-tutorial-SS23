package map;

// Define a generic interface Map<K,V> with a method get

//In Ocaml, we would write:
/*
  module type Map = sig
    type key
    type value
    type t
  
    val empty : t
    val set : key -> value -> t -> t
    val get : key -> t -> value
    val get_opt : key -> t -> value option
    (* val clear : key -> t -> t *)
    val to_string : t -> string
    val to_list : t -> (key * value) list
  end
*/

//Note that in java we dont have a type t, because the class name Map<K,V> is the type t. And since Java is object oriented, we never have to pass around the type t, because we can always call the methods on the object itself.

import java.util.List;
import java.util.Optional;

public interface Map<K, V> {

  void set(K key, V value);

  V get(K key);

  Optional<V> get_opt(K key);

  String to_string();

  List<Pair<K, V>> toList();
}