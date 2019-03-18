-- If some type is an instance of Monad type class, then we can make an instance of Functor
-- using return function and >== operator. We can do this even without knowing the internal
-- structure of type at hand.

-- Let's say you have a type
-- data SomeType a = ...
-- and it is an instance of Monad type class. Make it an instance of type class Functor.

instance Functor SomeType where
    fmap f x = x >>= return . f
