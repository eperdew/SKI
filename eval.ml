open Stack
open Ast
open Pprint

type env = var -> ski

exception UnboundVar of var

let create_environment () = fun s -> raise (UnboundVar s)
			  
let rec eval_ski (e:ski) (st:env):ski =
  match e with
  |S |K |I -> e
  |Var(v) -> eval_ski (st v) st
  |Term(e1,e2) ->
    let z = eval_ski e2 st in
    begin
      match e1 with
      |S |K -> Term(e1,z)
      |I -> z
      |Var(v) -> eval_ski (Term((st v),e2)) st
      |Term(e1',e2') ->
	begin
	  let y = eval_ski e2' st in
	  match e1' with
	  |S -> Term(Term(S,y),z)
	  |K -> y
	  |I -> eval_ski (Term(y,z)) st
	  |Var(v) -> eval_ski (Term(Term((st v),e2'),e2)) st
	  |Term(e1'',e2'') ->
	    begin
	      let x = eval_ski e2'' st in
	      match e1'' with
	      |S -> eval_ski (Term(Term(x,z),Term(y,z))) st
	      |K -> eval_ski (Term(x,z)) st
	      |I -> eval_ski (Term(Term(x,y),z)) st
	      |Var(v) -> eval_ski (Term(Term(Term((st v),e2''),e2'),e2)) st
	      |Term(e1'',e2'') -> eval_ski (Term((eval_ski e1 st),z)) st
	    end
	end
    end

let rec eval_program (p:program):ski =
  let rec helper (p:program) (st:env):ski =
    match p with
    |Ski(s) -> eval_ski s st
    |Let(x,s,p) ->
      let evalS1 = eval_ski s st in
      let newEnv = fun (s:string) -> if s = x then evalS1 else (st s) in
      helper p newEnv
  in
  helper p (create_environment ())
