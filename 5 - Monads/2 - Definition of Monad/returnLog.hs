-- Logging functions from the previous problem return a value with some additional
-- information as a list of messages. This list is a context. Implement returnLog function

-- returnLog :: a -> Log a

-- which is an analog of return for Log context. This function must return the given value
-- with the empty context.

returnLog :: a -> Log a
returnLog = Log []
