module Main where
import System.Environment

main :: IO ()
main = do
 -- Pitanje za ime i ispisivanje imena
 putStrLn "Kako se zoves?"
 name <- getLine
 putStrLn ("Drago mi je da smo se upoznali " ++ name)

-- Sabiranje dva broja
-- args <- getArgs
-- print ((read $ args!!0) + (read $ args!!1))
