-- Implement MapLike instance for type ArrowMap, which is defined below.

import Prelude hiding (lookup)
import Data.Maybe

class MapLike m where
    empty :: m k v
    lookup :: Ord k => k -> m k v -> Maybe v
    insert :: Ord k => k -> v -> m k v -> m k v
    delete :: Ord k => k -> m k v -> m k v
    fromList :: Ord k => [(k,v)] -> m k v

newtype ArrowMap k v = ArrowMap { getArrowMap :: k -> Maybe v }

instance MapLike ArrowMap where
    empty = ArrowMap $ const Nothing
    lookup k   (ArrowMap f) = f k
    insert k v (ArrowMap f) = ArrowMap $ combine (func k v)     f  where
        combine g h x = if isJust $ g x then g x else h x
        func k v x = if x == k then Just v else Nothing
    delete k   (ArrowMap f) = ArrowMap $ deleter f where
        deleter h x = if x == k then Nothing else h x
    fromList [] = empty
    fromList ((k,v) : xs) = insert k v $ fromList xs
