CC.lhs
chapter 01 

> main = interact charCount
>   where charCount input = (show $ sum $ map length $ words input) ++ "\n"

