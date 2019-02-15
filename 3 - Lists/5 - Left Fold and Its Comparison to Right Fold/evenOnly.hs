-- Using one call to fold function, implement the function evenOlny, which deletes all the elements
-- with odd indices from the list and leaves only elements with even indices.

-- GHCi> evenOnly [1..10]
-- [2,4,6,8,10]
-- GHCi> evenOnly ['a'..'z']
-- "bdfhjlnprtvxz"

evenOnly :: [a] -> [a]
evenOnly = map snd . filter (even . fst) . zip [1..]
