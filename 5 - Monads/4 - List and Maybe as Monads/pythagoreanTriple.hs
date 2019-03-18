-- Implement the following function using the list monad and do-notation

-- pythagoreanTriple :: Int -> [(Int, Int, Int)]

-- which takes some number x and returns the list of triples (a,b,c) so that

-- a2 + b2 = c2, a > 0, b > 0, c > 0,c ≤ x, a < b  

-- Number x can be ≤ 0, in this case the function should return the empty list.

-- GHCi> pythagoreanTriple 5
-- [(3,4,5)]

-- GHCi> pythagoreanTriple 0
-- []

-- GHCi> pythagoreanTriple 10
-- [(3,4,5),(6,8,10)]

pythagoreanTriple :: Int -> [(Int, Int, Int)]
pythagoreanTriple x = do
    a <- [1..x]
    b <- [1..x]
    c <- [1..x]
    True <- return $ a^2 + b^2 == c^2
    True <- return $ a < b
    return (a, b, c)