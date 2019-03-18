-- List type defined below is equivalent to the definition of lists in the standard
-- library in a way that there are converting functions from List a into [a] and vice versa.
-- Implement these functions.

data List a = Nil | Cons a (List a)

fromList :: List a -> [a]
fromList Nil = []
fromList (Cons x xs) = x : fromList xs

toList :: [a] -> List a
toList [] = Nil
toList (x : xs) = Cons x (toList xs)
