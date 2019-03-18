-- Implement Monoid type class instance for Maybe' a so that mempty would
-- not be equal to Maybe' Nothing. No additional restrictions can be applied to 
-- type a except for those in the task description.

newtype Maybe' a = Maybe' { getMaybe :: Maybe a }
    deriving (Eq,Show)

instance Monoid a => Monoid (Maybe' a) where
    mempty = Maybe' $ Just mempty
    l@(Maybe' Nothing) `mappend` r = l
    l `mappend` r@(Maybe' Nothing) = r
    (Maybe' l) `mappend` (Maybe' r) = Maybe' $ l `mappend` r
