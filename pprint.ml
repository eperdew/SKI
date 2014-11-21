open Ast

let rec print_ski (e:exp) : unit =
  match e with
  |S -> print_string "S"
  |K -> print_string "K"
  |I -> print_string "I"
  |Term(e1,e2) -> print_string "("; (print_ski e1); (print_ski e2); print_string ")"
