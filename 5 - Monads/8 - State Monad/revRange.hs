-- In previous modules we defined the type of binary trees, which contain values in 
-- their vertices:

-- data Tree a = Leaf a | Fork (Tree a) a (Tree a)

-- In this problem you are given a value of type Tree (). In other words, you are given the shape of the tree.
-- You need to number the vertices of the trees of the given shape using in-order traversal
-- (left subtree -> current vertex -> right subtree):

-- GHCi> numberTree (Leaf ())
-- Leaf 1
-- GHCi> numberTree (Fork (Leaf ()) () (Leaf ()))
-- Fork (Leaf 1) 2 (Leaf 3)

--data Tree a = Leaf a | Fork (Tree a) a (Tree a) deriving Show

numberTree :: Tree () -> Tree Integer
numberTree tree = evalState numerate (1, tree) where
    numerate :: State (Integer, Tree ()) (Tree Integer)
    numerate = do
        (x, t) <- get
        case t of
            Leaf _ -> return (Leaf x)
            Fork l _ r -> return (Fork left centerVal right) where
                left :: Tree Integer
                left = evalState numerate (x, l)
                
                centerVal :: Integer
                centerVal = unpack left + 1
                
                right :: Tree Integer
                right = evalState numerate (centerVal + 1, r)
                
                unpack :: Tree Integer -> Integer
                unpack (Leaf x) = x
                unpack (Fork _ _ r) = unpack r