-- returnLog and bindLog functions implemented earlier allow us to declare Log type an instance of Monad:

-- instance Monad Log where
--     return = returnLog
--     (>>=) = bindLog
-- Define execLoggersList function using return and >==

-- execLoggersList :: a -> [a -> Log a] -> Log a
-- which takes a certain element, a list of functions with logging and returns
-- a result of subsequent application of all the functions in the list to the
-- given element along with the list of messages produced by those functions:

-- GHCi> execLoggersList 3 [add1Log, mult2Log, \x -> Log ["multiplied by 100"] (x * 100)]
-- Log ["added one","multiplied by 2","multiplied by 100"] 800

execLoggersList :: a -> [a -> Log a] -> Log a
execLoggersList = undefined
