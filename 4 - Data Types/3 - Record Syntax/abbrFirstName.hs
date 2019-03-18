-- Define abbrFirstName function, which shortens the name to the first letter with a dot, so if
-- we have a name "Ivan", then after the function application we should have "I.". However,
-- if the name is shorter than 2 symbols, it does not change.

data Person = Person { firstName :: String, lastName :: String, age :: Int }

abbrFirstName :: Person -> Person
abbrFirstName p@(Person {firstName = fn})
    | length fn < 2 = p
    | otherwise     = p {firstName = [head fn, '.']}
