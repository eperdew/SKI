%{
open Ast
open Printf
open Lexing

let merge (fn,pos1,_) (_,_,pos2) = (fn,pos1,pos2)
%}

%token LPAREN RPAREN
       STERM KTERM ITERM
       LET IN EQUALS
       EOF
%token <string> VAR

%type <Ast.ski> t
%type <Ast.program> p 

%start p
 
%%

/* SKI Trees */
t : STERM                 { S }
  | KTERM                 { K }
  | ITERM                 { I }
  | LPAREN t t RPAREN     { Term($2, $3) }
  | VAR                   { Var($1) }
       
/* SKI Programs */
p : t EOF	          { Ski($1) }
  | LET VAR EQUALS t IN p { Let($2,$4,$6) }
