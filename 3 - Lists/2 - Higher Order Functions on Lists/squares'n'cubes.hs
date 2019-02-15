-- Implement a function squares'n'cubes taking a list of numbers and returning a list of
-- squares and cubes of those numbers.

-- GHCi> squares'n'cubes [3,4,5]
-- [9,27,16,64,25,125]

squares'n'cubes :: Num a => [a] -> [a]
squares'n'cubes = concatMap (\x -> [x^2, x^3])
