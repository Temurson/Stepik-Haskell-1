-- Make a list of integers containing only odd elements from the initial list.

-- GHCi> oddsOnly [2,5,7,10,11,12]
-- [5,7,11]
-- Use functions odd and even from tha standard library.

oddsOnly :: Integral a => [a] -> [a]
oddsOnly [] = []
oddsOnly (x : xs)  | odd x = x : oddsOnly xs
                   | otherwise = oddsOnly xs
