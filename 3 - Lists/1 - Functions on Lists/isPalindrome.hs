-- Implement function isPalindrom determining if the argument is a palindrome.

-- GHCi> isPalindrome "saippuakivikauppias"
-- True
-- GHCi> isPalindrome [1]
-- True
-- GHCi> isPalindrome [1, 2]
-- False

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome lst | head lst == last lst = isPalindrome $ init $ tail lst
                 | otherwise            = False
