-- Implement a function qsort. Function qsort must take a list of elements and sort it in ascending
-- order using Hoare sort: for some element x from the initial list (usually the first one) we divide
-- the list into elements of those less than x and those not less than x, and then do the same operation
-- recursively on the two parts.

-- GHCi> qsort [1,3,2,5]
-- [1,2,3,5]
-- You can only use functions from Prelude.

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort l@(first : _) = qsort (filter (< first) l) ++ filter (== first) l ++ qsort (filter (> first) l)
