-- Change the Shopping type definition and upgrade the purchase function from the previous problem in such a way
-- that you could implement items function, which returns the list of the purchased items (in the same order
-- as they were listed in the purchase).

-- shopping1 :: Shopping
-- shopping1 = do
--   purchase "Jeans"   19200
--   purchase "Water"     180
--   purchase "Lettuce"   328

-- GHCi> total shopping1 
-- 19708
-- GHCi> items shopping1
-- ["Jeans","Water","Lettuce"]
-- Implement items function and correct total function so that it would work like before.

type Shopping = Writer (Sum Integer, [String]) ()

purchase :: String -> Integer -> Shopping
purchase item cost = writer ((), (Sum cost, [item]))

total :: Shopping -> Integer
total = getSum . fst . execWriter

items :: Shopping -> [String]
items = snd . execWriter
