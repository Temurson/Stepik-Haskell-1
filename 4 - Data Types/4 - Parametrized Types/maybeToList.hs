-- Maybe can be implemented as a simple container, e.g. as a list of length 0 or 1.
-- Implement functions maybeToList and listToMaybe, which convert Maybe a into
-- [a] and vice versa. (the second function neglects all the elements in the list
-- except the first one)

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = [x]

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x : _) = Just x
