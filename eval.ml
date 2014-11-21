open Stack
open Ast

(* let rec eval e : exp =
  let rec helper (e:exp) (st:exp Stack.t) : exp =
    match e with
    | S -> if Stack.is_empty st then S else
	     begin
	       let x = Stack.pop st in
	       if Stack.is_empty st then Term(S,(eval x)) else
					  begin
					    let y = Stack.pop st in
					    if Stack.is_empty st then Term(Term(S,(eval x)),(eval y)) else begin let z = Stack.pop st in eval (Term(Term(x,z),Term(y,z))) end end end
    | K -> if Stack.is_empty st then K else
	     begin
	       let x = Stack.pop st in
	       if Stack.is_empty st then Term(K,(eval x)) else (eval x)
	     end
    | I -> if Stack.is_empty st then e else helper (pop st) st
    | Term(e1,e2) -> (push e2 st); helper e1 st
  in
  helper e (Stack.create ()) *)

let rec eval e : exp =
  let rec helper (e:exp) : exp =
    match e with
    |S |K |I -> e
    |Term(e1,e2) ->
      let z = helper e2 in
      begin
	match e1 with
	|S |K -> Term(e1,z)
	|I -> z
	|Term(e1',e2') ->
	  begin
	    let y = helper e2' in
	    match e1' with
	    |S -> Term(Term(S,y),z)
	    |K -> y
	    |I -> helper (Term(y,z))
	    |Term(e1'',e2'') ->
	      begin
		let x = helper e2'' in
		match e1'' with
		|S -> helper (Term(Term(x,z),Term(y,z)))
		|K -> helper (Term(x,z))
		|I -> helper (Term(Term(x,y),z))
		|Term(e1'',e2'') -> helper (Term((helper e1),z))
	      end
	  end
      end	
  in
  helper e
	    
		
				      

