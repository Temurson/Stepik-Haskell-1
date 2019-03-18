-- Let's check that you can emulate Reader monad with State monad.

-- Write a function readerToState, which lifts the computation from Reader monad into State monad.

-- GHCi> evalState (readerToState $ asks (+2)) 4
-- 6
-- GHCi> runState (readerToState $ asks (+2)) 4
-- (6,4)

readerToState :: Reader r a -> State r a
--               (e -> a) -> (e -> (a, e))
readerToState m = state $ \st -> (runReader m st, st)
