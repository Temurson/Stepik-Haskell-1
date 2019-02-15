-- Implement function concatList with foldr.

-- GHCi> concatList [[1,2],[],[3]]
-- [1,2,3]

concatList :: [[a]] -> [a]
concatList = foldr (++) []
