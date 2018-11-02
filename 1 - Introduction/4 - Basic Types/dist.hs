-- Points are represented by pairs of type (Double, Double). Implement dist function, which returns
-- distance between two points taken as arguments. Example:
-- dist :: (Double, Double) -> (Double, Double) -> Double
-- dist p1 p2 = ???

dist :: (Double, Double) -> (Double, Double) -> Double
dist p1 p2 = sqrt $ (fst p1 - fst p2)^2 + (snd p1 - snd p2)^2