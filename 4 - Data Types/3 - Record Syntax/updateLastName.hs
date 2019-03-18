-- Define updateLastName person1 person2 function, which changes surname of person2 to the surname of person1.

data Person = Person { firstName :: String, lastName :: String, age :: Int }

updateLastName :: Person -> Person -> Person
updateLastName person1 person2 = person2 {lastName = newLastName} where newLastName = lastName person1
