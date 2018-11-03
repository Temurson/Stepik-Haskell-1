-- Implement addTwoElements function, which adds its two arguments into the head
-- of the given list.
--
-- GHCi> addTwoElements 2 12 [85,0,6]
-- [2,12,85,0,6]

addTwoElements :: a -> a -> [a] -> [a]
addTwoElements x y l = x : y : l
