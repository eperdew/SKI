%{
open Ast
open Printf
open Lexing

let merge (fn,pos1,_) (_,_,pos2) = (fn,pos1,pos2)
%}

%token <Ast.info> LPAREN RPAREN STERM KTERM ITERM
%token EOF

%type <Ast.exp> t
%type <Ast.exp> p 

%start p
 
%%

/* SKI Trees */
t : STERM                 { S }
  | KTERM                 { K }
  | ITERM                 { I }
  | LPAREN t t RPAREN     { Term($2, $3) }
	     
       
/* Total Trees */
p : t EOF                 { $1 }
