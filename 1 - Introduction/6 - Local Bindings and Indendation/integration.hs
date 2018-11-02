-- Implement the function computing the value of a definite integral of function f on the interval
-- [a,b] using Trapezoid Method. (Use uniform grid; 1000 intervals is enough)

-- integration :: (Double -> Double) -> Double -> Double -> Double
-- integration f a b = undefined
-- GHCi> integration sin pi 0
-- -2.0

-- The result can be different from -2.0, but by not more than 1e-4.

integration :: (Double -> Double) -> Double -> Double -> Double
integration f a b = sum 0 0 where
      step :: Double
      step = (b - a) / 1000
      x :: Integer -> Double
      x i = a + fromInteger i * step
      sum :: Integer -> Double -> Double
      sum 1000 acc = acc
      sum i acc = sum (i + 1) (acc + (f (x i) + f (x (i + 1))) * (x (i + 1) - x i) / 2.0)
