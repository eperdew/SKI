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
}


let id = ['a'-'z'] ['a'-'z']*
let ws = [' ' '\t']		      

rule token = parse
| ws      { token lexbuf }
| '\n'    { newline lexbuf; token lexbuf }
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
| _       { raise LexingError }

