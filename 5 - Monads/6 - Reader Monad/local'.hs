-- Implement local' function from the previous problem.

-- Assume that Reader monad is defined as in the video:

-- data Reader r a = Reader { runReader :: (r -> a) }

-- instance Monad (Reader r) where
--   return x = Reader $ \_ -> x
--   m >>= k  = Reader $ \r -> runReader (k (runReader m r)) r

local' :: (r -> r') -> Reader r' a -> Reader r a
local' f m = reader $ \e -> runReader m (f e)
