-- Implement Printable type class with one method toString - one-argument function
-- transforming the argument of type class Printable into the String.

-- Make Bool and () instances of this type class, making the following possible:

-- GHCi> toString True
-- "true"
-- GHCi> toString False
-- "false"
-- GHCi> toString ()
-- "unit type"

class Printable a where
    toString :: a -> String

instance Printable Bool where
    toString True = "true"
    toString False = "false"

instance Printable () where
    toString _ = "unit type"