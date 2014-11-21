{
open Parser
open Printf
exception Eof
exception LexingError

let lineno = ref 1
let linestart = ref (-1)

let newline lexbuf : unit = 
  linestart := Lexing.lexeme_start lexbuf;
  incr lineno

(* let info lexbuf = 
  let c1 = Lexing.lexeme_start lexbuf in
  let c2 = Lexing.lexeme_end lexbuf in
  let l = !lineno in
  let c = !linestart + 1 in
    ((l, c1 - c),(l, c2 - c - 1))

let error lexbuf msg =
  let i = info lexbuf in
  let t = Lexing.lexeme lexbuf in   
  let ((l1,c1),(l2,c2)) = i in 
  let s = 
    if l2=l1
    then Printf.sprintf "line %d, characters %d-%d" l1 c1 c2
    else Printf.sprintf "line %d, character %d, to line %d, character %d" l1 c1 l2 c2 in 
  let err = Printf.sprintf "%s: lexing error %s at %s."      
    s
    msg 
    t in 
  raise (LexingError err)   *)
}


let id = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9' '_'] *
let ws = [' ' '\t' '\n']		      

rule token = parse
| ws      { token lexbuf }
| 'S'     { STERM }
| 'K'     { KTERM }
| 'I'     { ITERM }
| '('     { LPAREN }
| ')'     { RPAREN }
| "let"   { LET }
| '='     { EQUALS }
| "in"    { IN }
| id as v { VAR(v) }
| eof     { EOF }
| _ as c  { raise LexingError }

