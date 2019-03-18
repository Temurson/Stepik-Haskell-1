-- We have had type Result and function doSomeWork in one of the previous problems:

-- data Result = Fail | Success

-- doSomeWork :: SomeData -> (Result,Int)

-- doSomeWork returned the result and either the error code in case of failure or 0 in case of success. This
-- declaration is not the best, because in case of success we have to return some value, which does not carry
-- any actual information.

-- Using doSomeWork function, define doSomeWork' in such a way that it would return error code only in case of
-- failure. You need to define type Result' for this. Moreover, define instance Show for Result' in such a way
-- that show would return "Success" or "Fail: N", where N is the error code.

data Result' = Fail' Int | Success' Result

instance Show Result' where
    show (Fail' code) = "Fail: "  ++ show code
    show (Success' Success) = "Success"

doSomeWork' :: SomeData -> Result'
doSomeWork' d = if snd res == 0 then Success' Success else Fail' (snd res) where
    res = doSomeWork d
