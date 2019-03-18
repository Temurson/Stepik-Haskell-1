-- Implement getCenter function taking coordinate of the cell and returning coordinate of its
-- center and getCell function taking coordinate of the point and returning cell number in which
-- this point is located. Both functions take width of the cell as the first argument.

data Coord a = Coord a a

getCenter :: Double -> Coord Int -> Coord Double
getCenter s (Coord x y) = Coord (fromIntegral x * s + s / 2) (fromIntegral y * s + s / 2)

getCell :: Double -> Coord Double -> Coord Int
getCell s (Coord x y) = Coord (floor $ x / s) (floor $ y / s)
