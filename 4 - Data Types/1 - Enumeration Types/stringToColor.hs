-- Implement function isPalindrom determining if the argument is a palindrome.

-- GHCi> isPalindrome "saippuakivikauppias"
-- True
-- GHCi> isPalindrome [1]
-- True
-- GHCi> isPalindrome [1, 2]
-- False

data Color = Red | Green | Blue

stringToColor :: String -> Color
stringToColor "Red" = Red
stringToColor "Green" = Green
stringToColor "Blue" = Blue
