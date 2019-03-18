-- Define instance of type class Functor for the binary tree, which has Maybe elements in each vertex:

-- data Tree a = Leaf (Maybe a) | Branch (Tree a) (Maybe a) (Tree a) deriving Show

-- GHCi> words <$> Leaf Nothing
-- Leaf Nothing

-- GHCi> words <$> Leaf (Just "a b")
-- Leaf (Just ["a","b"])

import Data.Functor

instance Functor Tree where
    fmap f (Branch l x r) = Branch (f <$> l) (f <$> x) (f <$> r)
    fmap f (Leaf x) = Leaf $ f <$> x
