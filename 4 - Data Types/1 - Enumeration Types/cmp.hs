-- LogLevel type describes different logging levels.
-- data LogLevel = Error | Warning | Info

-- Define cmp function comparing elements of LogLevel type such that Error > Warning > Info.
-- GHCi> cmp Error Warning
-- GT
-- GHCI> cmp Info Warning
-- LT

cmp :: LogLevel -> LogLevel -> Ordering
cmp Error Error = EQ
cmp Warning Warning = EQ
cmp Info Info = EQ
cmp Error _   = GT
cmp _ Error   = LT
cmp Warning _ = GT
cmp _ Warning = LT
