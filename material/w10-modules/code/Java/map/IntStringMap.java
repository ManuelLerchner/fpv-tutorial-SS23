package map;
// Instantiate the generic BinaryTreeMap class with the IntOrderedPrintable class and the StringPrintable class

// In Ocaml, we would write:
/*
 open LibBinaryTreeMap
  open LibStringPrintable
  open LibIntOrderedPrintable

  module IntStringMap = BinaryTreeMap (IntOrderedPrintable) (StringPrintable)
*/

public class IntStringMap extends BinaryTreeMap<IntOrderedPrintable, StringPrintable> {

}