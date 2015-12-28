WC.lhs
chapter 01 

> main = interact wordCount
> --  where wordCount input = (show $ length $ lines input) ++ "\n"
>   where wordCount input = (show $ length $ words input) ++ "\n"
