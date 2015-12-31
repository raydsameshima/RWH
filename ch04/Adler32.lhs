Adler32.lhs

> import Data.Char (ord)
> import Data.Bits (shiftL, (.&.), (.|.))
>
> base = 65521
>
> adler32 xs = helper 1 0 xs
>   where
>     helper a b (x:xs) = 
>       let a' = (a + (ord x .&. 0xff)) `mod` base
>           b' = (a' + b) `mod` base
>       in  helper a' b' xs
>     helper a b _ = (b `shiftL` 16) .|. a

  *Main> :type ord
  ord :: Char -> Int

The shiftL function implements a logical shift left.
  *Main> :type shiftL 
  shiftL :: Data.Bits.Bits a => a -> Int -> a

These are bitwise "and" and "or":
  *Main> :type (.&.)
  (.&.) :: Data.Bits.Bits a => a -> a -> a
  *Main> :type (.|.)
  (.|.) :: Data.Bits.Bits a => a -> a -> a 

> adler32_try2 xs = helper (1,0) xs
>   where helper (a,b) (x:xs) =
>           let a' = (a + (ord x .&. 0xff)) `mod` base
>               b' = (a' + b) `mod` base
>           in  helper (a', b') xs
>         helper (a,b) _ = (b `shiftL` 16) .|. a
