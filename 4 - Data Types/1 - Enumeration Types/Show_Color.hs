-- Data type Color is defined like this:

-- data Color = Red | Green | Blue
-- Define instance of Show for Color, which corresponds textual representation to each color.

-- GHCi> show Red
-- "Red"

instance Show Color where
    show Red = "Red"
    show Green = "Green"
    show Blue = "Blue"
