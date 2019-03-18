-- Correct the definition of expand function

-- infixl 6 :+:
-- infixl 7 :*:
-- data Expr = Val Int | Expr :+: Expr | Expr :*: Expr
--     deriving (Show, Eq)

-- expand :: Expr -> Expr
-- expand ((e1 :+: e2) :*: e) = expand e1 :*: expand e :+: expand e2 :*: expand e
-- expand (e :*: (e1 :+: e2)) = expand e :*: expand e1 :+: expand e :*: expand e2
-- expand (e1 :+: e2) = expand e1 :+: expand e2
-- expand (e1 :*: e2) = expand e1 :*: expand e2
-- expand e = e
-- in such a way that it would always return value that is equivalent to the given one and that
-- is a sum of products of the numeric values using distributivity (and maybe associativity and commutativity).
-- For example, 

-- GHCi> expand $ (Val 1 :+: Val 2 :+: Val 3) :*: (Val 4 :+: Val 5)
-- Val 1 :*: Val 4 :+: (Val 1 :*: Val 5 :+: (Val 2 :*: Val 4 :+: (Val 2 :*: Val 5 :+: (Val 3 :*: Val 4 :+: Val 3 :*: Val 5))))
-- Note. Braces in the answer can be placed differently or be absent, because addition is associative. Addends can come in
-- any order, because addition is commutative.

infixl 6 :+:
infixl 7 :*:
data Expr = Val Int | Expr :+: Expr | Expr :*: Expr
    deriving (Show, Eq)

expand :: Expr -> Expr
expand expr@((e1 :+: e2) :*: e) = expand $ expand e1 :*: expand e :+: expand e2 :*: expand e
expand expr@(e :*: (e1 :+: e2)) = expand $ expand e :*: expand e1 :+: expand e :*: expand e2
expand expr@(e1 :+: e2)
    | expr == expand e1 :+: expand e2 = expand e1 :+: expand e2
    | otherwise                       = expand $ expand e1 :+: expand e2
expand expr@(e1 :*: e2)
    | expr == expand e1 :*: expand e2 = expand e1 :*: expand e2
    | otherwise                       = expand $ expand e1 :*: expand e2
expand e = e
