-- Implement seqA function, computing elements of the following recurrent sequence:
-- a0 = 1; a1 = 2; a2 = 3; a(k+3) = a(k+2) + a(k+1) - 2a(k).
-- Try to find an effective solution.

-- GHCi> seqA 301
-- 1276538859311178639666612897162414

seqA :: Integer -> Integer
seqA n | n >= 0 = let
                    f a b c 0 = a
                    f a b c k = f b c (c + b - 2 * a) (k - 1)
                 in f 1 2 3 n
       | otherwise = error "condition n >= 0 is violated"