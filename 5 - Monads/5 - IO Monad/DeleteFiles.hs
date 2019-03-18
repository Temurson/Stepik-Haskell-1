-- In this problem you are going to work with IO monad, so your program is going to interact with the operating system.
-- Please use only the functions that work with files and directories, such as getDirectoryContents and removeFile, in
-- order to let the testing system evaluate your submission. All these functions will be available, so you should not
-- import them. For the same reason, your main function should me called main' instead of main.

-- Write a program, which asks the user for any string, and then delete all the files in current directory, if the
-- the name of the file contains the given string. You should output corresponding messages in the process.

-- Substring: 

-- The user enters the string:

-- Substring: hell


-- Then the program deletes the files in current directory if they have the given string as a substring. For example,
-- if current directory would have files thesis.txt, kitten.jpg, hello.world, linux_in_nutshell.pdf, the output would
-- look like this:

-- Substring: hell
-- Removing file: hello.world
-- Removing file: linux_in_nutshell.pdf


-- If the user entered nothing (pressed Enter), you should not delete anything and notify about this:

-- Substring: 
-- Canceled


-- In order to get the list of files in the current directory use getDirectoryContents function, giving it a string
-- consisting one one dot ("."), which means "current directory". In order to delete the files use a function removeFile
-- (assume that the current directory has no subdirectories, only regular files). The output messages for deleted files
-- must be outputted in the same order as returned by getDirectoryContents function.

-- Please strictly use the provided output format. Pay special attention to spaces and line breaks! Do not forget about
-- a space after Substring: and about a line break in the very end (it is expected that you will use putStrLn for output).

import Data.List

main' :: IO ()
main' = do
    putStr "Substring: "
    substr <- getLine
    if null substr then
        putStrLn "Canceled"
    else do
        dir <- getDirectoryContents "."
        mapM_ (\fileName -> if substr `isInfixOf` fileName then removeFile fileName >> putStrLn ("Removing file: " ++ fileName) else return ()) dir
