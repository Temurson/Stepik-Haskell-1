-- Consider one more example of recursive data type:

-- data Nat = Zero | Suc Nat
-- Elements of this type have the following format:
-- Zero, Suc Zero, Suc (Suc Zero), Suc (Suc (Suc Zero)) and so on. Therefore, we
-- can assume that elements of this type are natural numbers in the unary number system.

-- We can write a function converting Nat into Integer like this:

-- fromNat :: Nat -> Integer
-- fromNat Zero = 0
-- fromNat (Suc n) = fromNat n + 1
-- Implement addition and multiplication functions for these numbers and also function
-- that computes factorial.

data Nat = Zero | Suc Nat deriving Show

fromNat :: Nat -> Integer
fromNat Zero = 0
fromNat (Suc n) = fromNat n + 1

toNat :: Integer -> Nat
toNat 0 = Zero
toNat n = Suc $ toNat $ n - 1

add :: Nat -> Nat -> Nat
add x y = toNat $ fromNat x + fromNat y

mul :: Nat -> Nat -> Nat
mul x y = toNat $ fromNat x * fromNat y

fac :: Nat -> Nat
fac = toNat . facInt . fromNat where
    facInt 0 = 1
    facInt n = n * facInt (n - 1)
