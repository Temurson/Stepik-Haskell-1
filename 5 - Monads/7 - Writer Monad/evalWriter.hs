-- execWriter function starts the computation contained in Writer monad and returns the resulting log,
-- ignoring the computation result. Implement evalWriter function, which ignores the resulting log
-- and returns only the computation result.

evalWriter :: Writer w a -> a
evalWriter = fst . runWriter
