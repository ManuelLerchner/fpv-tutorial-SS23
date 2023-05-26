type vector3 = float * float * float

let (p1 : vector3) = (1.0, -2.0, 3.0)
let (p2 : vector3) = (1.0, 3.0, 6.0)
let p3 = (1.0, 8.0, -3.0)

let string_of_vector3 (v : vector3) =
  let x, y, z = v in
  "(" ^ string_of_float x ^ "," ^ string_of_float y ^ "," ^ string_of_float z
  ^ ")"

let vector3_add (a : vector3) (b : vector3) =
  let x1, y1, z1 = a in
  let x2, y2, z2 = b in
  (x1 +. x2, y1 +. y2, z1 +. z2)

let length (v : vector3) =
  let x, y, z = v in
  sqrt ((x *. x) +. (y *. y) +. (z *. z))

let vector3_max (a : vector3) (b : vector3) =
  let a_longer_b = length a > length b in
  if a_longer_b then a else b

let combine a b c =
  let max = vector3_max b c in
  string_of_vector3 (vector3_add a max)
