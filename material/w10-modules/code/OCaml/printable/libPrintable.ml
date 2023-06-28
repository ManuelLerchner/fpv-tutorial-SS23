module type Printable = sig
  type t
  val to_string : t -> string
end
