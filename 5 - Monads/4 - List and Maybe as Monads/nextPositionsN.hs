-- Let's say we have a data type describing a chess board configuration:

-- data Board = ...
-- In addition, let the following function be defined:
-- nextPositions :: Board -> [Board]
-- This function takes some board configuration and returns all possible configuration, which you can get
-- if any figure makes one move. Implement a function:
-- nextPositionsN :: Board -> Int -> (Board -> Bool) -> [Board]
-- which takes a board configuration, number of moves n, a predicate and returns all the possible board
-- configurations, which you can get, if the figures make n moves, which satisfy the given predicate.
-- When n < 0 the function must return an empty list.

-- Assume that the type Board and the function nextPositions are already implemented.

nextPositionsN :: Board -> Int -> (Board -> Bool) -> [Board]
nextPositionsN b n pred
  | n < 0            = [ ]
  | n == 0           = case (pred b) of { True -> [b]; False -> [] }
  | n > 0            = do
      p <- nextPositions b
      nextPositionsN p (n - 1) pred
