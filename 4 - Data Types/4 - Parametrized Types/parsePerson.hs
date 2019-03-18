-- Implement parsePerson function, which parses strings like firstName = John\nlastName = Connor\nage = 30
-- and returns either Person or Error.

-- Input string must split on '\n' symbol into a list of strings, each of which looks like
-- X = Y. If the input string does not fit this syntax, the function must return ParsingError.
-- If not all the fields are present, IncompleteDataError is returned.
-- If the field age contains not a number, then IncorrectDataError str is returned, where str is contents of age field.
-- If the string has any other fields, then they are ignored.

import Control.Arrow ((***))
import Control.Monad (join)

trim xs = dropSpaceTail "" $ dropWhile (== ' ') xs

dropSpaceTail maybeStuff "" = ""
dropSpaceTail maybeStuff (x:xs)
        | x == ' ' = dropSpaceTail (x:maybeStuff) xs
        | null maybeStuff = x : dropSpaceTail "" xs
        | otherwise       = reverse maybeStuff ++ x : dropSpaceTail "" xs

data Error = ParsingError | IncompleteDataError | IncorrectDataError String

data Person = Person { firstName :: String, lastName :: String, age :: Int }

parsePerson :: String -> Either Error Person
parsePerson = construct . checkAge . checkFields . checkFormat . transform where
    transform :: String -> [(String, String)]
    transform text = map (join (***) trim . deleteEqSign . span (/= '=')) $ lines text where
        deleteEqSign (left, "") = (left, "")
        deleteEqSign (left, _ : right) = (left, right)

    checkFormat :: [(String, String)] -> Either Error [(String, String)]
    checkFormat [] = Left ParsingError
    checkFormat text
        | all (\(left, right) -> not (null left) && not (null right)) text
            = Right text
        | otherwise
            = Left  ParsingError

    checkFields :: Either Error [(String, String)] -> Either Error [(String, String)]
    checkFields (Right text)
        | let
              hasField fieldName = any (\(left, _) -> left == fieldName) text
          in
              hasField "firstName" && hasField "lastName" && hasField "age"
            = Right text
        | otherwise
            = Left  IncompleteDataError
    checkFields err = err

    checkAge :: Either Error [(String, String)] -> Either Error [(String, String)]
    checkAge (Right text)
        | any (\(left, right) -> left == "age" &&
                                 (reads right :: [(Int, String)]) /= [] &&
                                 snd (head (reads right :: [(Int, String)])) == "") text
            = Right text
        | otherwise
            = Left $ IncorrectDataError $ getIncorrectAge text
        where
            getIncorrectAge :: [(String, String)] -> String
            getIncorrectAge ((left, right) : text)
                | left == "age" = right
                | otherwise = getIncorrectAge text
    checkAge err = err

    construct :: Either Error [(String, String)] -> Either Error Person
    construct (Right text) = Right Person {firstName = getField "firstName" text,
                                           lastName  = getField "lastName"  text,
                                           age       = getAge               text} where
        getField :: String -> [(String, String)] -> String
        getField fieldName ((left, right) : text)
            | left == fieldName = right
            | otherwise = getField fieldName text

        getAge :: [(String, String)] -> Int
        getAge ((left, right) : text)
            | left == "age" = read right
            | otherwise = getAge text
    construct (Left err) = Left err
