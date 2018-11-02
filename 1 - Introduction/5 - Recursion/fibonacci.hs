-- Fibonacci sequence 0,1,1,2,3,5,8,13,21,... is easily defined by recursion.
-- F0 = 0, F1 = 1, Fn = Fn-1 + Fn-2 
-- This can be written in Haskell as
-- fibonacci 0 = 0
-- fibonacci 1 = 1
-- fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)
-- This function is defined for nonnegative numbers only. However, we could infer fibonacci formula for
-- negative arguments:
-- F(-1) = 1, F(-2) = -1, F(-10) = -55, ...
-- Change the given implementation to include negative numbers.

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n | n > 0 = fibonacci (n - 1) + fibonacci (n - 2)
            | n < 0 = fibonacci (n + 2) - fibonacci (n + 1)