ListADT.lhs

> data List a = Cons a (List a)
>             | Nil
>             deriving (Show, Eq)
>
> fromList :: [a] -> List a
> fromList [] = Nil
> fromList (x:xs) = Cons x $ fromList xs
> 
> toList :: List a -> [a]
> toList Nil = []
> toList (Cons x xs) = x : (toList xs)
