-- The function discount returns final price after taking into account possible discount.
-- Its 3 arguments are initial price sum, discount percentage proc and the discount
-- is made if the sum is greater than limit.
-- discount :: Double -> Double -> Double -> Double
-- discount limit proc sum = if sum >= limit then sum * (100 - proc) / 100 else sum

-- Type declaration is not obligatory, though it is recommended for documentation purposes.

-- Your task is to fill in type of the function standardDiscount.

-- standardDiscount :: ???
-- standardDiscount = discount 1000 5 

discount :: Double -> Double -> Double -> Double
discount limit proc sum = if sum >= limit then sum * (100 - proc) / 100 else sum

standardDiscount :: Double -> Double
standardDiscount = discount 1000 5