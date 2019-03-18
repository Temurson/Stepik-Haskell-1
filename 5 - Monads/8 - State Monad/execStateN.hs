-- If we want to compute n-th Fibonacci number using imperative programming language, we would do this using
-- two variables and a cycle, which updates those variables:

-- def fib(n):
--   a, b = 0, 1
--   for i in [1 .. n]:
--     a, b = b, a + b
--   return a
-- In Haskell, this construct is easy to imagine as a computation with state. The state in this case is two
-- integer values.

-- Imperative algorithm works very simple: it makes n steps, each of which changes the current state in some way.
-- First, implement fibStep function, which changes the state in the same way as one cycle in imperative algorithm:

-- GHCi> execState fibStep (0,1)
-- (1,1)
-- GHCi> execState fibStep (1,1)
-- (1,2)
-- GHCi> execState fibStep (1,2)
-- (2,3)
-- After this, you only need to apply this step n times to the correct initial value and get the result. Implement
-- the auxiliary function execStateN, which takes the number of steps n, the computation with state and the initial
-- value, then starts the computation n times and gives the resulting state (ignoring the computation results).
-- We can compute Fibonacci numbers by applying this function to fibStep.

-- fib :: Int -> Integer
-- fib n = fst $ execStateN n fibStep (0, 1)

fibStep :: State (Integer, Integer) ()
fibStep = modify $ \(a, b) -> (b, a + b)

execStateN :: Int -> State s a -> s -> s
execStateN n = execState . replicateM n
