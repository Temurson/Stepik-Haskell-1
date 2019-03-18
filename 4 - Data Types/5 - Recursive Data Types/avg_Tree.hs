-- Now implement a function avg computing the average of all the values in the tree.
-- We want this function to do only one traversal of the tree. This can be done using
-- help auixiliary function returning number of leaves and sum of their values.

data Tree a = Leaf a | Node (Tree a) (Tree a)

avg :: Tree Int -> Int
avg t =
    let (c,s) = go t
    in s `div` c
  where
    go :: Tree Int -> (Int,Int)
    go (Leaf x)   = (1, x)
    go (Node l r) = (lc + rc, ls + rs) where
      (lc, ls) = go l
      (rc, rs) = go r