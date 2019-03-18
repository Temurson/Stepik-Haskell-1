-- Implement a function searching for the first entry of the digit symbol in a string
-- and returning Nothing if there are no digit symbols in the string.

import Data.List
import Data.Char(isDigit)

findDigit :: [Char] -> Maybe Char
findDigit = find isDigit
