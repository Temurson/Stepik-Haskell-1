-- Using functions map and concatMap implement the function perms returning all the permutations,
-- which can be generated from the given list, in any order.

-- GHCi> perms [1,2,3]
-- [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
-- Assume that all the elements in the list are unique and that an empty list has 1 permutation.

perms :: [a] -> [[a]]
perms [] = [[]]
perms [e] = [[e]]
perms (e : rest) = concatMap (ins $ length rest) (perms rest) where
    ins (-1) _ = []
    ins n    l = (take n l ++ [e] ++ drop n l) : ins (n - 1) l
