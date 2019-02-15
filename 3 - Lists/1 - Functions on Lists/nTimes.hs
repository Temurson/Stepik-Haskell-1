-- Implement function nTimes that returns a list of repeating values of its first argument. The number
-- of repetitions is set by the second argument.
--
-- GHCi> nTimes 42 3
-- [42,42,42]
-- GHCi> nTimes 'z' 5
-- "zzzzz"

nTimes:: a -> Int -> [a]
nTimes el 0 = []
nTimes el n = el : nTimes el (n - 1)
