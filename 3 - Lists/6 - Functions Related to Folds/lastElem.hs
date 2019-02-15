-- Implement the function returning the last list of the element using foldl1.

-- lastElem :: [a] -> a
-- lastElem = foldl1 undefined

lastElem :: [a] -> a
lastElem = foldl1 (flip const)
