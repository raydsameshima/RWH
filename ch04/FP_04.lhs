FP_04.lhs

CHAPTER 4
Functional Programming

> module FP_04 where

The Left Fold
The foldl function takes a "step" function, an initial value for its accumulator, and a "list":
  
  *Main> :type foldl
  foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b

> myFoldl :: (a -> b -> a) -> a -> [b] -> a
> myFoldl step zero (x:xs) = myFoldl step newZero xs
>   where newZero = step zero x
> myFoldl _    zero []     = zero

  *FP_04> myFoldl (*) 1 [1,2,3,4]
  24
  *FP_04> myFoldl (+) 0 [1,2,3,4]
  10

Understanding foldl in terms of foldr

  *FP_04> :type foldr
  foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b

> myFoldl' :: (Foldable t) => (a -> b -> a) -> a -> t b -> a
> myFoldl' f z xs = foldr step id xs $ z
> --  where step x g a = g $ f a x 
>   where step x g a = g $ a `f` x 

  f :: a -> b -> a
  z :: a
  xs :: t b
  step :: (a -> a) -> b -> (a -> a)
  x :: a -> a


