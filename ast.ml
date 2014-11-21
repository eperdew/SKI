type info = (int * int) * (int * int)

type exp =
  |S
  |K
  |I
  |Term of exp*exp

