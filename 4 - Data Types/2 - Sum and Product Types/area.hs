-- Define type Shape:

-- data Shape = Circle Double | Rectangle Double Double
-- It has 2 constructors: Circle r - circle of radius r, and Rectangle a b - rectangle with sides a and b. Implement function
-- area returning area of the shape. Constant pi is already defined in the standard library.

data Shape = Circle Double | Rectangle Double Double

area :: Shape -> Double
area (Circle r) = pi * r^2
area (Rectangle a b) = a * b
