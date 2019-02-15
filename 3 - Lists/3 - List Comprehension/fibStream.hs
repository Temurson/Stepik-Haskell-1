-- Using zipWith define a function fibStream, which returns an infinite list
-- of fibonacci numbers.

-- GHCi> take 10 $ fibStream
-- [0,1,1,2,3,5,8,13,21,34]

fibStream :: [Integer]
fibStream = 0 : 1 : zipWith (+) fibStream (tail fibStream)
