-- Data.Function module contains a higher order function on:

-- on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
-- on op f x y = f x `op` f y

-- It takes 4 arguments: binary operator with same-type arguments, function
-- f :: a -> b and 2 values of type a. Function on applies f on both values
-- of type a and passes the result into the binary operator.

-- Using on you can implement sum of squares function:

-- sumSquares = (+) `on` (^2)

-- multSecond function, multiplying second elements of pairs is implemented
-- like this:
-- multSecond = g `on` h

-- g = undefined
-- h = undefined

-- Implement g and h.

-- GHCi> multSecond ('A',2) ('E',7)
-- 14

import Data.Function

multSecond = g `on` h

g = (*)

h = snd