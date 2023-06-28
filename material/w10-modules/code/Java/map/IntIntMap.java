package map;
// Instantiate the generic BinaryTreeMap class with the IntOrderedPrintable class

// In Ocaml, we would write:
/*
  open LibBinaryTreeMap
  open LibIntOrderedPrintable

  module IntIntMap = BinaryTreeMap (IntOrderedPrintable) (IntOrderedPrintable)
*/

public class IntIntMap extends BinaryTreeMap<IntOrderedPrintable, IntOrderedPrintable> {

}