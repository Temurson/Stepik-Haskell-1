-- Try to get evenOnly to work with infinite lists. For example, this should work:
-- GHCi> take 3 (evenOnly [1..])
-- [2,4,6]

evenOnly :: [a] -> [a]
evenOnly = map snd . filter (even . fst) . zip [1..]
