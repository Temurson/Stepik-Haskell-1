-- Implement 3-argument function getSecondFrom, polymorphic for each argument,
-- which ignores the 1st and the 3rd arguments and returns the 2nd. Mark its type.

-- GHCi> getSecondFrom True 'x' "Hello"
-- 'x'
-- GHCi> getSecondFrom 'x' 42 True 
-- 42

getSecondFrom :: a -> b -> c -> b
getSecondFrom first second third = second