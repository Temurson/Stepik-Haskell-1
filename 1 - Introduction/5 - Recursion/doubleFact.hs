-- Define a function computing double factorial, i.e. product of natural numbers not exceeding the given number
-- and having same evenness. Example: 7!!=7*5*3*1,  8!!=8*6*4*2. It is assumed that argument is nonnegative.

doubleFact :: Integer -> Integer
doubleFact n = if n <= 0 then 1 else n * doubleFact (n - 2)