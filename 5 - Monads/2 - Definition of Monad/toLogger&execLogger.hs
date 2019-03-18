-- Let's introduce the following type:

-- data Log a = Log [String] a
-- Implement computation with logging useing Log. First, define toLogger function

-- toLogger :: (a -> b) -> String -> (a -> Log b)
-- which converts a regular function into a function with logging:

-- GHCi> let add1Log = toLogger (+1) "added one"
-- GHCi> add1Log 3
-- Log ["added one"] 4

-- GHCi> let mult2Log = toLogger (* 2) "multiplied by 2"
-- GHCi> mult2Log 3
-- Log ["multiplied by 2"] 6
-- Next, define execLoggers function

-- execLoggers :: a -> (a -> Log b) -> (b -> Log c) -> Log c

-- This function takes some element and 2 functions with logging. execLoggers returns
-- the result of subsequent function application and a list of messages, which were
-- produced by each function application:
-- GHCi> execLoggers 3 add1Log mult2Log
-- Log ["added one","multiplied by 2"] 8

toLogger :: (a -> b) -> String -> (a -> Log b)
toLogger f msg x = Log [msg] (f x)

execLoggers :: a -> (a -> Log b) -> (b -> Log c) -> Log c
execLoggers x f g = Log [getMessage $ f x, getMessage $ g (getValue . f $ x)] (getValue . g . getValue . f $ x) where
    getMessage :: Log a -> String
    getMessage (Log [msg] _) = msg
    getValue   :: Log a -> a
    getValue   (Log _     v) = v
