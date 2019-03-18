-- Now let's check that you can emulate Writer monad with State monad.

-- Write a function readerToState, which lifts the computation from Writer monad into State monad.

-- GHCi> runState (writerToState $ tell "world") "hello,"
-- ((),"hello,world")
-- GHCi> runState (writerToState $ tell "world") mempty
-- ((),"world")

-- Note that when you work with Writer monad it is assumed that the inital log is empty (to be
-- exact, the initial value is a neutral element of the monoid), because the monad interface
-- does not let to have the initial value. The State monad can do that (set the initial value).

writerToState :: Monoid w => Writer w a -> State w a
writerToState m = state $ \st -> let (result, output) = runWriter m in (result, st `mappend` output)
