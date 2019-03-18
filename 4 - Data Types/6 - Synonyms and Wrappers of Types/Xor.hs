-- Implement Monoid class instance for Xor type, where mappend does xor operation.

import Data.Bits

newtype Xor = Xor { getXor :: Bool }
    deriving (Eq,Show)

instance Monoid Xor where
    mempty = Xor False
    mappend (Xor True) (Xor False) = Xor True
    mappend (Xor False) (Xor True) = Xor True
    mappend _ _ = Xor False
