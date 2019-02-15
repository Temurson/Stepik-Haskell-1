-- Make a list of sums of the corressponding elements of the three given lists. The length of the resultant list
-- must be equal to the length of the longest among the initial lists. "Missing" elements a the ends of the lists
-- should not contribute to the sums.

-- GHCi> sum3 [1,2,3] [4,5] [6]
-- [11,7,3]

sum3 :: Num a => [a] -> [a] -> [a] -> [a]
sum3 [] [] [] = []
sum3 xs ys zs = (headOrZero xs + headOrZero ys + headOrZero zs) : sum3 (tailOrEmpty xs) (tailOrEmpty ys) (tailOrEmpty zs) where
    headOrZero :: Num a => [a] -> a
    headOrZero [] = 0
    headOrZero l = head l
    tailOrEmpty :: Num a => [a] -> [a]
    tailOrEmpty [] = []
    tailOrEmpty l = tail l
