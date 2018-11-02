-- Implement the function computing the sum and the number of digits of a given decimal number.
-- sum'n'count :: Integer -> (Integer, Integer)
-- sum'n'count x = undefined
-- GHCi> sum'n'count (-39)
-- (12,2)

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count 0 = (0, 1)
sum'n'count x = (sum, count) where
      (sum, count) = f (abs x) 0 0
      f 0 s c = (s, c)
      f x s c = f (x `div` 10) (s + x `mod` 10) (c + 1)