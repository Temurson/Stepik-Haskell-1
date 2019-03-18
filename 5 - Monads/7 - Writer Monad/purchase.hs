-- Let's develop a program for cash machines of one store in Iceland. The client is going to describe
-- the bought goods with the type Shopping:

-- type Shopping = Writer (Sum Integer) ()

-- shopping1 :: Shopping
-- shopping1 = do
--   purchase "Jeans"   19200
--   purchase "Water"     180
--   purchase "Lettuce"   328

-- The sequence of purchased items is written using do-notation. purchase function is used for this, which you should
-- implement. This function takes the item name and its price in Iceland kronas (represented as Integer). In addition,
-- you should implement total function:

-- GHCi> total shopping1 
-- 19708

purchase :: String -> Integer -> Shopping
purchase item = tell . Sum

total :: Shopping -> Integer
total = getSum . execWriter
