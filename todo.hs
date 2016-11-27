import System.Directory
import System.IO
import System.IO.Unsafe
import System.Directory
import Data.List

main = do
  let todoFile = unsafePerformIO getHomeDirectory ++ "/.todo"
  handle <- openFile todoFile ReadMode
  contents <- hGetContents handle
  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
  putStrLn "TODO:"
  putStr $ unlines numberedTasks
