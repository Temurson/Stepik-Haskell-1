-- Define instance of type class Functor for Entry and Map data types.
-- Type Map represents a dictionary, where the keys are pairs:

-- data Entry k1 k2 v = Entry (k1, k2) v  deriving Show
-- data Map k1 k2 v = Map [Entry k1 k2 v]  deriving Show

-- As a result, you should have the following behavior: fmap applies a function to the values in the dictionary without
-- altering the keys.

-- GHCi> fmap (map toUpper) $ Map []
-- Map []

-- GHCi> fmap (map toUpper) $ Map [Entry (0, 0) "origin", Entry (800, 0) "right corner"]
-- Map [Entry (0,0) "ORIGIN",Entry (800,0) "RIGHT CORNER"]

instance Functor (Entry k1 k2) where
    fmap f (Entry k v) = Entry k (f v)

instance Functor (Map k1 k2) where
    fmap f (Map l) = Map $ map (fmap f) l
