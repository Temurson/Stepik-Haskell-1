-- Implement type class

-- class SafeEnum a where
--   ssucc :: a -> a
--   spred :: a -> a
-- both functions behave like suc and pred of standard Enum, but are total, i.e.
-- do not terminate with an error on the greatest and the least values of the
-- Enum, but have a cyclic behavior. Your class must be an extension of the
-- classes of standard library, so you could make the default implementation of
-- its methods, letting to define its instances without writing any code.
-- For example, for Bool type it should be enough to write the following line:

-- instance SafeEnum Bool
-- and have the ability to call like this:

-- GHCi> ssucc False
-- True
-- GHCi> ssucc True
-- False

class (Enum a, Bounded a, Eq a) => SafeEnum a where
  ssucc :: a -> a
  ssucc x = if x == maxBound then minBound else succ x

  spred :: a -> a
  spred x = if x == minBound then maxBound else pred x
