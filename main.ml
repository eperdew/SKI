(* main function *)
let () =
  let _ = 
    if Array.length Sys.argv <> 2 then
      (Printf.printf "Usage: ski <file>\n";
       exit 0) in 
  let filename = Sys.argv.(1) in 
  let lexbuf = Lexing.from_channel (open_in filename) in 
  let prog =
    try Parser.p Lexer.token lexbuf
    with Parsing.Parse_error ->
      Printf.printf "Syntax error at line %d character %d\n" 
        !Lexer.lineno 
        (Lexing.lexeme_end lexbuf - !Lexer.linestart - 1);
      exit 1 in 
  begin
    (print_string "Evaluating: ");
    Pprint.print_program prog;
    (print_string "\nResult: ");
    (Pprint.print_ski (Eval.eval_program prog));
    print_newline ()
  end
	 
