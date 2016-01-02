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
> myFoldl _    zero []     = zero -- base (terminate) case

  *FP_04> myFoldl (*) 1 [1,2,3,4]
  24
  *FP_04> myFoldl (+) 0 [1,2,3,4]
  10

The class of functions that we can express using foldr is called primitive recursive.
A surprisingly large number of list manipulation functions are primitive recursive.
In fact, we can even write foldl using foldr!

Understanding foldl in terms of foldr

  *FP_04> :type foldr
  foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b

> myFoldl' :: (Foldable t) => (a -> b -> a) -> a -> t b -> a
> myFoldl' f z xs = foldr step id xs $ z
> --  where step x g aa = g $ f aa x 
> --  where step x g aa = g $ aa `f` x 
> --  where step x g aa = g . (`f` x) $ aa
> --  where step x g = g . (`f` x)
>   where x `step` g = g . (`f` x)

  f :: a -> b -> a
  z :: a 
  xs :: t b
  foldr :: (b -> a -> a) -> a -> t b -> a

  foldr :: (b -> (a -> a) -> (a -> a)) -- step
        -> (a -> a)                    -- id
        -> t b                         -- xs
        -> (a -> a) 
  step :: b -> (a -> a) -> (a -> a)
  x :: b
  g :: a -> a 
  aa :: a -> a

Think about it, by definition left-fold is

  foldl f z (x:xs) = foldl f (f zero x) xs

and

  myFoldl' f z (x:xs) = foldr step id (x:xs) $ z
    where x `step` g = g . (`f` x)
                      
where
  foldr step id (x:xs) = step x (foldr step id xs)
                       = x `step` (foldr step id xs)
                       = (foldr step id xs) . (`f` x)

Explicitly, for [x1,x2,x3],
  
  myFoldl' f z [x1,x2,x3] 
    = foldr step id [x1,x2,x3] $ z
    = (foldr step id [x2,x3]) . (`f` x1) $ z
    = (foldr step id [x3]) . (`f` x2) . (`f` x1) $ z
    = (foldr step id []) . (`f` x3) . (`f` x2) . (`f` x1) $ z
    = id . (`f` x3) . (`f` x2) . (`f` x1) $ z
    = id . (`f` x3) . (`f` x2) . (f z x1)
    = id . (`f` x3) . (f (f z x1) x2)
    = id . (f (f (f z x1) x2) x3)
    = (f (f (f z x1) x2) x3)
    = foldl f z [x1,x2,x3]


  
                      

