-- Recursive implementation of fibonacci function is very ineffective. The number of function calls
-- grows exponentially as the argument grows. GHCi lets trace memory and time usage for computation
-- using :set +s command.

-- GHCi> :set +s
-- GHCi> fibonacci 30
-- 832040
-- (8.36 secs, 298293400 bytes)


-- Implement a more effective function having linear complexity using accumulators. It should be defined
-- for all integers.

f :: Integer -> Integer -> Integer -> Integer
f a b 0 = a
f a b n | n > 0 = f b (a + b) (n - 1)
        | n < 0 = f (b - a) a (n + 1)

fibonacci = f 0 1