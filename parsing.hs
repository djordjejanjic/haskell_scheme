module Main where
import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

spaces :: Parser ()
spaces = skipMany1 space

data LispVal = Atom String
		| List [LispVal]
		| DottedList [ListpVal] LispVal
		| Number Integer
		| String String
		| Bool Bool

parseString :: Parser LispVal
parseString = do
 char '"'
 x <- many (noneOf "\"")
 char '"'
 return $ String x

readExpr :: String -> String
readExpr input = case parse (spaces >> symbol) "lisp" input of
 Left err -> "No match: " ++ show err
 Right val -> "Found value"

main :: IO()
main = do
 (expr:_) <- getArgs
 putStrLn (readExpr expr)
