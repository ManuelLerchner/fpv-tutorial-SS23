package map;
// Define a generic interface OrderedPrintable<T> that extends Printable<T> with a method compare

// In Ocaml, we would write:
/*
  open LibPrintable

  module type OrderedPrintable = sig
    include Printable

    val compare : t -> t -> int
  end
*/

public interface OrderedPrintable<T> extends Printable<T> {
  int compare(T t1, T t2);
}
