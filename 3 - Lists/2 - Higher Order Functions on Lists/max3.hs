-- Write a function max taking 3 lists of the same length and returning a list of numbers
-- of the same length containing maximal number of the corresponding 3 numbers in each
-- position of the list.

-- GHCi> max3 [7,2,9] [3,6,8] [1,8,10]
-- [7,8,10]

max3 :: Ord a => [a] -> [a] -> [a] -> [a]
max3 xs ys zs = map (\(x, y, z) -> max x $ max y z) (zip3 xs ys zs)
