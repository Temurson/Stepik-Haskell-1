-- Implement a function filterDisj taking 2 unary predicates and a list, and returning
-- a list of elements satisfying at least one of the predicates.

-- GHCi> filterDisj (< 10) odd [7,8,10,11,12]
-- [7,8,11]

filterDisj :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filterDisj p1 p2 = filter (\el -> p1 el || p2 el)
