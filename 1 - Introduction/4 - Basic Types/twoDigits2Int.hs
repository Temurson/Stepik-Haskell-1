-- Implement twoDigits2Int function, which takes to symbols and returns the number made up from these symbols if both of them are digits,
-- and 100 otherwise. Example:
-- GHCi> twoDigits2Int '4' '2'
-- 42

import Data.Char
twoDigits2Int :: Char -> Char -> Int
twoDigits2Int x y = if isDigit x && isDigit y then digitToInt x * 10 + digitToInt y else 100