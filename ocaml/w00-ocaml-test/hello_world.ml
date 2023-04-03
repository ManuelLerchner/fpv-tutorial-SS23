let welcome_string = "lmaCO ot emocleW ,!dlroW olleH"

let rec char_iterator sentence =
  if sentence = "" then ()
  else
    let head = String.get sentence 0 in
    let tail = String.sub sentence 1 (String.length sentence - 1) in
    char_iterator tail;
    print_char head

(* Call Function: Result will be visible in the console when loaded via utop *)
let _ = char_iterator welcome_string
