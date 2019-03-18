-- Define instance of type class Functor for the data type GeomPrimitive, which is defined like this:

-- data GeomPrimitive a = Point (Point3D a) | LineSegment (Point3D a) (Point3D a)
-- Use the fact that Point3D is already an instance of Functor type class.

-- GHCi> fmap (+ 1) $ Point (Point3D 0 0 0)
-- Point (Point3D 1 1 1)

-- GHCi> fmap (+ 1) $ LineSegment (Point3D 0 0 0) (Point3D 1 1 1)
-- LineSegment (Point3D 1 1 1) (Point3D 2 2 2)

instance Functor GeomPrimitive where
    fmap f (Point p) = Point $ fmap f p
    fmap f (LineSegment s e) = LineSegment (fmap f s) (fmap f e)
