type token =
  | LPAREN of (Ast.info)
  | RPAREN of (Ast.info)
  | STERM of (Ast.info)
  | KTERM of (Ast.info)
  | ITERM of (Ast.info)
  | EOF

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"

open Ast
open Printf
open Lexing

let merge (fn,pos1,_) (_,_,pos2) = (fn,pos1,pos2)
# 19 "parser.ml"
let yytransl_const = [|
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* LPAREN *);
  258 (* RPAREN *);
  259 (* STERM *);
  260 (* KTERM *);
  261 (* ITERM *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\001\000\002\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\004\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\001\000\002\000\003\000\000\000\006\000\
\000\000\005\000\000\000\004\000"

let yydgoto = "\002\000\
\007\000\008\000"

let yysindex = "\001\000\
\000\255\000\000\000\255\000\000\000\000\000\000\007\000\000\000\
\000\255\000\000\006\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\253\255\000\000"

let yytablesize = 8
let yytable = "\009\000\
\003\000\001\000\004\000\005\000\006\000\011\000\010\000\012\000"

let yycheck = "\003\000\
\001\001\001\000\003\001\004\001\005\001\009\000\000\000\002\001"

let yynames_const = "\
  EOF\000\
  "

let yynames_block = "\
  LPAREN\000\
  RPAREN\000\
  STERM\000\
  KTERM\000\
  ITERM\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.info) in
    Obj.repr(
# 20 "parser.mly"
                          ( S )
# 82 "parser.ml"
               : Ast.exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.info) in
    Obj.repr(
# 21 "parser.mly"
                          ( K )
# 89 "parser.ml"
               : Ast.exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.info) in
    Obj.repr(
# 22 "parser.mly"
                          ( I )
# 96 "parser.ml"
               : Ast.exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : Ast.info) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.exp) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.info) in
    Obj.repr(
# 23 "parser.mly"
                          ( Term(_2, _3) )
# 106 "parser.ml"
               : Ast.exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.exp) in
    Obj.repr(
# 27 "parser.mly"
                          ( _1 )
# 113 "parser.ml"
               : Ast.exp))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.exp)
