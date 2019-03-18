-- You can find definition of type class MapLike below. Define instance of
-- this type class for type ListMap, which is defined below as a list of
-- key-value pairs. Each key has no more than one corresponding value.
-- insert function replaces the old value with the new one, if the key is
-- is already present in the data structure.

import Prelude hiding (lookup)
import qualified Data.List as L

class MapLike m where
    empty :: m k v
    lookup :: Ord k => k -> m k v -> Maybe v
    insert :: Ord k => k -> v -> m k v -> m k v
    delete :: Ord k => k -> m k v -> m k v
    fromList :: Ord k => [(k,v)] -> m k v
    fromList [] = empty
    fromList ((k,v):xs) = insert k v (fromList xs)

newtype ListMap k v = ListMap { getListMap :: [(k,v)] }
    deriving (Eq,Show)
