-- Define record type, which stores log elements. The constructor name must match
-- the type name, and the record must contain 3 fields:
-- timestamp — time when the event occurred (of type UTCTime);
-- logLevel — level of the event (of type LogLevel);
-- message — error message (of type String).
-- Define logLevelToString function, which returns textual representation of LogLevel,
-- and define logEntryToString function, which returns textual representation looking like this:

-- <time>: <level>: <message>


-- Use timeToString to convert UTCTime to string.

import Data.Time.Clock
import Data.Time.Format
import System.Locale

timeToString :: UTCTime -> String
timeToString = formatTime defaultTimeLocale "%a %d %T"

data LogLevel = Error | Warning | Info deriving Show

data LogEntry = LogEntry {timestamp :: UTCTime, logLevel :: LogLevel, message :: String}

logLevelToString :: LogLevel -> String
logLevelToString = show

logEntryToString :: LogEntry -> String
logEntryToString entry = timeToString (timestamp entry) ++ ": " ++ show (logLevel entry) ++ ": " ++ message entry
