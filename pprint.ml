open Ast

let rec print_ski (e:ski) : unit =
  match e with
  |S -> print_string "S"
  |K -> print_string "K"
  |I -> print_string "I"
  |Term(e1,e2) -> print_string "("; (print_ski e1); (print_ski e2); print_string ")"

let rec print_program (p:program) : unit =
  match p with
  |Ski(s) -> print_ski s
  |Let(v,s,p) -> (print_string ("let "^v^" = "));
		   (print_ski s);
		   (print_string " in\n");
		   print_program p
				 
