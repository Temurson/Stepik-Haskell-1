-- Recall the example with database of users and passwords:

-- type User = String
-- type Password = String
-- type UsersTable = [(User, Password)]
-- Implement a function, which takes UsersTable as an environment and returns a list of users who use
-- "123456" password (in the same order as they listed in the database).

-- GHCi> runReader usersWithBadPasswords [("user", "123456"), ("x", "hi"), ("root", "123456")]
-- ["user","root"]

usersWithBadPasswords :: Reader UsersTable [User]
usersWithBadPasswords = do
  users <- ask
  return $ map fst . filter ((== "123456") . snd) $ users
