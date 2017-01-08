GS_01.lhs

CHAPTER 1
Getting Started

> module GS_01 where

ghc

A simple program

> wordCount :: String -> String
> wordCount input = show (length (lines input)) ++ "\n"

> wordCount' = length . lines

> wc fileName = do
>   str <- readFile fileName
>   return . wordCount' $ str

  *GS_01> :t wc
  wc :: FilePath -> IO Int
  *GS_01> wc "quux.txt" 
  7
