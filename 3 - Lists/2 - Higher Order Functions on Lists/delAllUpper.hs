-- Implement delAllUpper function, which deletes all the words comprised of only capital letters from the text.
-- It is assumed that the text contains only alphabet symbols and spaces. 

-- GHCi> delAllUpper "Abc IS not ABC"
-- "Abc not"
-- Try to implement this function as a chain of compositions.

import Data.Char (isUpper)

delAllUpper :: String -> String
delAllUpper = unwords . filter (/= []) . map (\word -> if all isUpper word then [] else word) . words
