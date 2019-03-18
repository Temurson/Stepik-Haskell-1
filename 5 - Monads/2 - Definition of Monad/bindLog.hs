-- Implement bindLog function

-- bindLog :: Log a -> (a -> Log b) -> Log b
-- which works analogous to the >== operator for Log context.

-- GHCi> Log ["nothing done yet"] 0 `bindLog` add1Log
-- Log ["nothing done yet","added one"] 1

-- GHCi> Log ["nothing done yet"] 3 `bindLog` add1Log `bindLog` mult2Log
-- Log ["nothing done yet","added one","multiplied by 2"] 8

bindLog :: Log a -> (a -> Log b) -> Log b
bindLog (Log msgs1 val) f = let Log msgs2 res = f val
                            in Log (msgs1 ++ msgs2) res
