-- In this problem you are going to work with IO monad, so your program is going to interact with the operating system.
-- Please use only the functions that work with terminal IO, such as getChar, putChar, putStr, putStrLn and getLine, in
-- order to let the testing system evaluate your submission. All these functions will be available, so you should not
-- import them. For the same reason, your main function should me called main' instead of main.

-- Write a program, which asks the user for their name, and then greet them with that name. If the user
-- did not provide a name, the program must ask it again, and continue asking until the user gives their name.

-- First, the program asks for the name:

-- What is your name?
-- Name: 

-- The user enters a name and the program greets them:

-- What is your name?
-- Name: Valera
-- Hi, Valera!


-- If the user did not enter the name, you need to show the same question one more time:
-- What is your name?
-- Name: 
-- What is your name?
-- Name: 
-- What is your name?
-- Name: Valera
-- Hi, Valera!


-- Please strictly use the provided output format. Pay special attention to spaces and line breaks! Do not forget about
-- a space after Name: and about a line break in the very end (it is expected that you will use putStrLn for output).

main' :: IO ()
main' = do
    putStr "What is your name?\nName: "
    name <- getLine
    if null name then
        main'
    else
        putStrLn $ "Hi, " ++ name ++ "!"
