-- Implement a function lengthList, counting the number of elements in the list using foldr.

-- GHCi> lengthList [7,6,5]
-- 3

lengthList :: [a] -> Int
lengthList = foldr (\_ s -> 1 + s) 0
