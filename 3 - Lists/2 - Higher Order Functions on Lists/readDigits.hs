-- Write a function readDigits taking a string and returning a pair of strings.
-- The first element of the pair contains digit digital prefix of the initial string, and the second
-- contains the rest.

-- GHCi> readDigits "365ads"
-- ("365","ads")
-- GHCi> readDigits "365"
-- ("365","")
-- Use function isDigit from the module Data.Char.

import Data.Char (isDigit)

readDigits :: String -> (String, String)
readDigits = span isDigit
