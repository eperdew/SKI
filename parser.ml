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

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"

open Ast
open Printf
open Lexing

let merge (fn,pos1,_) (_,_,pos2) = (fn,pos1,pos2)
# 23 "parser.ml"
let yytransl_const = [|
  257 (* LPAREN *);
  258 (* RPAREN *);
  259 (* STERM *);
  260 (* KTERM *);
  261 (* ITERM *);
  262 (* LET *);
  263 (* IN *);
  264 (* EQUALS *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  265 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\001\000\001\000\002\000\002\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\004\000\001\000\002\000\006\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\001\000\002\000\003\000\000\000\005\000\
\000\000\008\000\000\000\000\000\006\000\000\000\000\000\004\000\
\000\000\000\000\007\000"

let yydgoto = "\002\000\
\009\000\010\000"

let yysindex = "\001\000\
\000\255\000\000\010\255\000\000\000\000\000\000\254\254\000\000\
\010\000\000\000\010\255\008\255\000\000\015\255\010\255\000\000\
\011\255\000\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\253\255\002\000"

let yytablesize = 20
let yytable = "\011\000\
\003\000\001\000\004\000\005\000\006\000\007\000\012\000\014\000\
\008\000\013\000\003\000\017\000\004\000\005\000\006\000\015\000\
\016\000\018\000\008\000\019\000"

let yycheck = "\003\000\
\001\001\001\000\003\001\004\001\005\001\006\001\009\001\011\000\
\009\001\000\000\001\001\015\000\003\001\004\001\005\001\008\001\
\002\001\007\001\009\001\018\000"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  STERM\000\
  KTERM\000\
  ITERM\000\
  LET\000\
  IN\000\
  EQUALS\000\
  EOF\000\
  "

let yynames_block = "\
  VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 23 "parser.mly"
                          ( S )
# 100 "parser.ml"
               : Ast.ski))
; (fun __caml_parser_env ->
    Obj.repr(
# 24 "parser.mly"
                          ( K )
# 106 "parser.ml"
               : Ast.ski))
; (fun __caml_parser_env ->
    Obj.repr(
# 25 "parser.mly"
                          ( I )
# 112 "parser.ml"
               : Ast.ski))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.ski) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.ski) in
    Obj.repr(
# 26 "parser.mly"
                          ( Term(_2, _3) )
# 120 "parser.ml"
               : Ast.ski))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 27 "parser.mly"
                          ( Var(_1) )
# 127 "parser.ml"
               : Ast.ski))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.ski) in
    Obj.repr(
# 30 "parser.mly"
                    ( Ski(_1) )
# 134 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Ast.ski) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : Ast.program) in
    Obj.repr(
# 31 "parser.mly"
                          ( Let(_2,_4,_6) )
# 143 "parser.ml"
               : Ast.program))
(* Entry p *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let p (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
