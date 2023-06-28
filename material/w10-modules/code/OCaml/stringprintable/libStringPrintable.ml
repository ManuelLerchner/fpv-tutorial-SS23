open LibPrintable

module StringPrintable : Printable with type t = string = struct
  type t = string

  let to_string : t -> string = fun t -> "\"" ^ t ^ "\""
end
