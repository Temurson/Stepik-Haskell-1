-- Implement a function meanList, which finds the mean value of the list elements using one call of fold function.

-- GHCi> meanList [1,2,3,4]
-- 2.5
-- Postprocessing is permitted, i.e. the assumed implementation looks like:
-- meanList = someFun . foldr someFoldingFun someIni

meanList :: [Double] -> Double
meanList l = sum l / (fromIntegral $ length l)
