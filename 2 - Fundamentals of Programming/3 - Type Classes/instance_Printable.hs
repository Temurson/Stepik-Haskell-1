-- Make pair an instance of type class Printable that you implemented in the last
-- problem, making the following possible:

-- GHCi> toString (False,())
-- "(false,unit type)"
-- GHCi> toString (True,False)
-- "(true,false)"
-- Note: you do not need to declare Printable and make Bool and () its instances.

instance (Printable a, Printable b) => Printable (a, b) where
    toString (a, b) = "(" ++ toString a ++ "," ++ toString b ++ ")"