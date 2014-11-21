
type var = string
	     
type ski =
  |S
  |K
  |I
  |Var of var
  |Term of ski*ski

type program =
  |Let of var*ski*program
  |Ski of ski
