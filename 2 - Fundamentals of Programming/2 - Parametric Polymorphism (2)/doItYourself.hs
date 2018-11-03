-- One-argument function doItYourself chooses the biggest between the argument and 42,
-- cubes the result, and calculates binary logarithm of the result. Its implementation:

-- doItYourself = f . g . h

-- Implement f, g and h. Try to do it point-free.

-- f = undefined
-- g = undefined
-- h = undefined

doItYourself = f . g . h

h = max 42

g = (^3)

f = logBase 2