package map;
// Define a generic interface Printable<T> with a method to_string

// In Ocaml, we would write:
/*
  module type Printable = sig
  type t
  val to_string : t -> string
  end
*/

public interface Printable<T> {

  String to_string(T t);

  T getT();
}
