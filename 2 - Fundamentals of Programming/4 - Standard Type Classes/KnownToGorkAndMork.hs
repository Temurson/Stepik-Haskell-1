-- There are 2 type classes KnownToGork and KnownToMork, which have
-- methods stomp (stab) and doesEnrageGork (doesEnrageMork) respectively:
--
-- class KnownToGork a where
--     stomp :: a -> a
--     doesEnrageGork :: a -> Bool
--
-- class KnownToMork a where
--     stab :: a -> a
--     doesEnrageMork :: a -> Bool
-- Type class KnownToGorkAndMork is an extension of both classes, having
-- extra method stompOrStab:
--
-- class (KnownToGork a, KnownToMork a) => KnownToGorkAndMork a where
--     stompOrStab :: a -> a
-- Define the default implementation of stompOrStab, which calls stomp,
-- if the argument is enraging Mork; calls stab if the argument enrages
-- Gork; stab and then stomp if the argument enrages both of them. If
-- none of the listed above happens, the method should return the
-- argument.

class KnownToGork a where
    stomp :: a -> a
    doesEnrageGork :: a -> Bool

class KnownToMork a where
    stab :: a -> a
    doesEnrageMork :: a -> Bool

class (KnownToGork a, KnownToMork a) => KnownToGorkAndMork a where
    stompOrStab :: a -> a
    stompOrStab x | doesEnrageGork x && doesEnrageMork x = stomp $ stab x
                  | doesEnrageGork x = stab x
                  | doesEnrageMork x = stomp x
                  | otherwise = x
