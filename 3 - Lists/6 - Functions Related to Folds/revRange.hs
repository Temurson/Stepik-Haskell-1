-- Using unfoldr, implement the function returning the list of characters in reverse alphabetical order,
-- taking only characters within the given range. Character x is within range (a,b) if x >= a и x <= b.

-- revRange :: (Char,Char) -> [Char]
-- revRange = unfoldr g 
--   where g = undefined
-- GHCi> revRange ('a','z')
-- "zyxwvutsrqponmlkjihgfedcba"

revRange :: (Char, Char) -> String
revRange = unfoldr g where
    g :: (Char, Char) -> Maybe (Char, (Char, Char))
    g (end, begin)
        | begin < end = Nothing
        | otherwise   = Just (begin, (end, pred begin))
