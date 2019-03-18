-- Consider the arithmetic expression language, which consists of numbers, brackets and addition and multiplication operations.
-- Constructions of this language may be represented with the following data type:

-- data Token = Number Int | Plus | Minus | LeftBrace | RightBrace 
--     deriving (Eq, Show)
-- Implement a lexer of the arithmetic expressions. First, implement the following function:

-- asToken :: String -> Maybe Token

-- This function checks whether the given string is a number (use isDigit from module Data.Char), a symbol "+" or "-" or
-- an opening or closing bracket. If the string is one of those, then it returns the corresponding value wrapped in Just,
-- otherwise it returns Nothing:

-- GHCi> asToken "123"
-- Just (Number 123)

-- GHCi> asToken "abc"
-- Nothing

-- Then, implement tokenize function:

-- tokenize :: String -> Maybe [Token]
-- This function takes a string and if every word in it is a valid token, it returns a list of those tokens wrapped in Just.
-- Otherwise, it returns Nothing.

-- The function must split the input string into separate words by spaces (use library function words). Then, the resulting
-- list of string must be folded using asToken function and properties of Maybe Monad:

-- GHCi> tokenize "1 + 2"
-- Just [Number 1,Plus,Number 2]

-- GHCi> tokenize "1 + ( 7 - 2 )"
-- Just [Number 1,Plus,LeftBrace,Number 7,Minus,Number 2,RightBrace]

-- GHCi> tokenize "1 + abc"
-- Nothing
-- Note that the brackets are separated by spaces from other expressions!

asToken :: String -> Maybe Token
asToken s | s == ")"  = Just RightBrace
          | s == "("  = Just LeftBrace
          | s == "+"  = Just Plus
          | s == "-"  = Just Minus
          | all isNumber s = Just . Number . read $ s
          | otherwise = Nothing

tokenize :: String -> Maybe [Token]
tokenize = foldr f (Just []) . words where
    f :: String -> Maybe [Token] -> Maybe [Token]
    f val (Just acc) = do
    token <- asToken val :: Maybe Token
    Just $ token : acc
    f _ Nothing = Nothing
