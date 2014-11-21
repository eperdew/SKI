type token =
  | LPAREN
  | RPAREN
  | STERM
  | KTERM
  | ITERM
  | LET
  | IN
  | EQUALS
  | EOF
  | VAR of (string)

val p :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
