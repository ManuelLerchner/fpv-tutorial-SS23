open LibPrintable

module type OrderedPrintable = sig
  include Printable

  val compare : t -> t -> int
end
