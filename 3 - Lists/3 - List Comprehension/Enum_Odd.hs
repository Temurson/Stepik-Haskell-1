-- Consider type Odd of odd numbers defined like this:
-- data Odd = Odd Integer 
--   deriving (Eq, Show)
-- Make this type an instance of Enum.

-- GHCi> succ $ Odd (-100000000000003)
-- Odd (-100000000000001)
-- Constructions with an even argument, e.g. Odd 2 are considered illegal and are not tested.

-- Note: we have not yet introduced declaration of user-defined data types, but hopefully
-- the above declaration does not confuse you. Here is defined the data type with
-- constructor Odd. As a matter of fact, it is a simple wrapper for type Integer.
-- deriving (Eq, Show) says the compiler to autogenerate instances of the corresponding type
-- classes for our type. This can be done for a number of standard type classes. Values of

-- GHCi> let x = Odd 33
-- GHCi> x
-- Odd 33
-- That is how to use type Odd in pattern matching:

-- addEven :: Odd -> Integer -> Odd
-- addEven (Odd n) m | m `mod` 2 == 0 = Odd (n + m)
--                   | otherwise      = error "addEven: second parameter cannot be odd"

instance Enum Odd where
    succ (Odd x) = Odd (x + 2)
    pred (Odd x) = Odd (x - 2)
  
    toEnum = Odd . toInteger
    fromEnum (Odd x) = fromInteger x
  
    enumFrom (Odd start) = map Odd [start, start+2..]
    enumFromThen (Odd start) (Odd next) = map Odd [start, next..]
    enumFromTo (Odd start) (Odd end) = map Odd [start, start+2..end]
    enumFromThenTo (Odd start) (Odd next) (Odd end) = map Odd [start,next..end]
  