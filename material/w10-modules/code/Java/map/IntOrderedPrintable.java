package map;
// Define a class IntOrderedPrintable that implements OrderedPrintable<Integer>

// In Ocaml, we would write:
/*
   module IntOrderedPrintable : OrderedPrintable with type t = int = struct
    type t = int
     let to_string t = string_of_int t
    let compare = compare
  end
*/

public class IntOrderedPrintable implements OrderedPrintable<Integer> {

  public Integer t;

  public IntOrderedPrintable(Integer t) {
    this.t = t;
  }

  public String to_string(Integer t) {
    return Integer.toString(t);
  }

  public int compare(Integer t1, Integer t2) {
    return Integer.compare(t1, t2);
  }

  public Integer getT() {
    return t;
  }
}
