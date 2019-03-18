-- Integer can be represented as a list of bits with sign.

-- Implement functions of addition and multiplication of such numbers assuming
-- that lower bits come first in the list and higher bits come last. You
-- can assume that input cannot have numbers with leading zeroes.

import Data.List

data Bit = Zero | One
data Sign = Minus | Plus
data Z = Z Sign [Bit]

bitToInteger :: Bit -> Integer
bitToInteger Zero = 0
bitToInteger One  = 1

integerToBit :: Integer -> Bit
integerToBit 0 = Zero
integerToBit 1 = One

zToInteger :: Z -> Integer
zToInteger (Z Plus  n) =        sum (zipWith (\d p -> bitToInteger d * 2^p) n [0..])
zToInteger (Z Minus n) = (-1) * sum (zipWith (\d p -> bitToInteger d * 2^p) n [0..])

integerToZ :: Integer -> Z
integerToZ n
    | n >= 0    = Z Plus  $ convert $ abs n
    | otherwise = Z Minus $ convert $ abs n
    where
    convert = unfoldr (\n -> if n == 0 then Nothing else Just (integerToBit $ rem n 2, quot n 2))

add :: Z -> Z -> Z
add x y = integerToZ $ zToInteger x + zToInteger y

mul :: Z -> Z -> Z
mul x y = integerToZ $ zToInteger x * zToInteger y
