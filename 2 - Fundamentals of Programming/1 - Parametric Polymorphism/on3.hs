-- Implement on3 function having semantics similar to on, but taking 3-argument function as the first argument.
-- on3 :: (b -> b -> b -> c) -> (a -> b) -> a -> a -> a -> c
-- on3 op f x y z = undefined

-- Example:
-- GHCi> let sum3squares = (\x y z -> x+y+z) `on3` (^2)
-- GHCi> sum3squares 1 2 3
-- 14

on3 :: (b -> b -> b -> c) -> (a -> b) -> a -> a -> a -> c
on3 op f x y z = op (f x) (f y) (f z)