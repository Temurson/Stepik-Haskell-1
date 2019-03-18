-- Define instance of type class Functor for the following data type, which represents a point in 3D space:

-- data Point3D a = Point3D a a a deriving Show

-- GHCi> fmap (+ 1) (Point3D 5 6 7)
-- Point3D 6 7 8

instance Functor Point3D where
    fmap f (Point3D x y z) = Point3D (f x) (f y) (f z)
