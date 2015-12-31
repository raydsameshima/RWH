LocalFunction.lhs

> pluralise :: String -> [Int] -> [String]
> pluralise word counts = map plural counts
>   where plural 0 = "no " ++ word ++ "s"
>         plural 1 = "one " ++ word
>         plural n = show n ++ " " ++ word ++ "s"
>
> pluralise' word counts = map plural counts
>   where 
>     plural n
>       | n <= 0    = "no " ++ word ++ "s"
>       | n == 1     = "one " ++ word
>       | otherwise = show n ++ " " ++ word ++ "s"
