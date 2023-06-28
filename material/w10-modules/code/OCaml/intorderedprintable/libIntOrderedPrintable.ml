open LibOrderedPrintable

module IntOrderedPrintable : OrderedPrintable with type t = int = struct
  type t = int

  let to_string t = string_of_int t
  let compare = compare
end
