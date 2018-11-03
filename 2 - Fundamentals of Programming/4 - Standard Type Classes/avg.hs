-- Implement a function with signature:

-- avg :: Int -> Int -> Int -> Double

-- that computes average value of the arguments

-- GHCi> avg 3 4 8
-- 5.0

avg :: Int -> Int -> Int -> Double
avg a b c = fromInteger (toInteger a + toInteger b + toInteger c) / 3.0
