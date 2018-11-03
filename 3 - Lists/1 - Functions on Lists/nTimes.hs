-- Implement function sign that returns 1 if the number is positive, (-1) is the number is negative
-- and 0 if the number is 0.

sign x = if x > 0 then 1 else (if x < 0 then (-1) else 0)