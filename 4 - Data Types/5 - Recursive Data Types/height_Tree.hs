-- Implement function height returning height of the tree and size function
-- returning number of vertices in the tree (both internal and the leaves).
-- The tree consisting of just one leaf is considered to have height of 0.

data Tree a = Leaf a | Node (Tree a) (Tree a)

height :: Tree a -> Int
height Leaf{} = 0
height (Node l r) = max (height l) (height r) + 1

size :: Tree a -> Int
size Leaf{} = 1
size (Node l r) = 1 + size l + size r
