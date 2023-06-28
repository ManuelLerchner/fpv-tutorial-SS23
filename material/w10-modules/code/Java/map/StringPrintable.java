package map;

// Define a class StringPrintable that implements Printable<String>
// The to_string method should return the quoted string

// In Ocaml, we would write:
/*
 open LibPrintable

 module StringPrintable : Printable with type t = string = struct
  type t = string

  let to_string : t -> string = fun t -> "\"" ^ t ^ "\""
end

*/

public class StringPrintable implements Printable<String> {

    public String t;

    public StringPrintable(String t) {
        this.t = t;
    }

    public String to_string(String t) {
        return "\"" + t + "\"";
    }

    public String getT() {
        return t;
    }
}
