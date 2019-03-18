-- Implement findDigitOrX funtion, which uses findDigit function (no need to implement it) and
-- returns the digit in the string or returns 'X' symbol if there are no digits. Use case construction.

import Data.Char(isDigit)

findDigit :: [Char] -> Maybe Char

findDigitOrX :: [Char] -> Char
findDigitOrX d = case findDigit d of
    Nothing -> 'X'
    Just c  -> c
