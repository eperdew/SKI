type token =
  | LPAREN of (Ast.info)
  | RPAREN of (Ast.info)
  | STERM of (Ast.info)
  | KTERM of (Ast.info)
  | ITERM of (Ast.info)
  | EOF

val p :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.exp
