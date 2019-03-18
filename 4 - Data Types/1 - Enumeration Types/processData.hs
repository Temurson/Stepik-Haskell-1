-- Let the following data type be declared:

-- data Result = Fail | Success


-- Assume that some data type SomeData is declared and some function
-- doSomeWork :: SomeData -> (Result,Int)
-- returning either the result and either error code in case of error or 0 in case of success
-- Define function processData, which calls doSomeWork and returns a string "Success" in case of its successful
-- completion or "Fail: N" in case of failure, where N is error code.

processData :: SomeData -> String
processData = helper . doSomeWork where
    helper (Success, _) = "Success"
    helper (Fail,    n) = "Fail: " ++ show n
