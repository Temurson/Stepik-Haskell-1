-- Consider a list of coin values sorted in ascending order. Use list comprehension to
-- write a function change that splits the given money amount into the coins with values
-- from the list coins in every possible way. For example, if
-- coins = [2, 3, 7]
-- GHCi> change 7
-- [[2,2,3],[2,3,2],[3,2,2],[7]]

-- Note: order of coins in each split matters, so [2, 2, 3] and [2, 3, 2] are different.
-- Do not define the list coins.

import Data.List

change :: (Ord a, Num a) => a -> [[a]]
change 0      = []
change amount = helper amount [] coinsStream 0 where
    helper :: (Ord a, Num a) => a -> [a] -> [a] -> Int -> [[a]]
    helper a acc cs@(c : rest) cnt
        | cnt == iterationCount = []
        | a == 0    = [acc]
        | a <  0    = []
        | otherwise = nub (helper (a - c) (c : acc) cs (cnt + 1) ++ helper a acc rest (cnt + 1))
    coinsStream :: (Ord a, Num a) => [a]
    coinsStream = concat $ repeat coins
    iterationCount = 30
