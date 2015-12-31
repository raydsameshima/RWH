TAF_02.lhs

CHAPTER 2
Types and Functions

> module TAF_02 where

on page 38 
Further Reading
There is a deep mathematical sense in which any nonpathological function of type 
  (a,b) -> a
must do exactly what fst does.
Moreover, this line of reasoning extends to more complicated polymorphic function.
The paper "Theorem for free" by Philip Wadler covers this procedure in depth.

http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.38.9875&rep=rep1&type=pdf

1. Introduction
Haskell's words, our function has its type
  r :: [a] -> [a]
This theorem will state that for all types 
  a, b
and every total function
  f :: a -> b
we have
  (map f) . r == r . (map f)   
or more explicitly
  (map f) . (r :: [a] -> [a]) == (r :: [b] -> [b]) . (map f)   

It seems like a "naturality" in some categorical sense.

2. Parametricity explained
The usual way to read a type is as a set.

An alternative is to read a type as a relation.
To read types as relations, we give a relational equivalent for constant types and for each of the type constructors a \times b, [a], a -> b, and \forall x.a(x).
The nontrivial examples are lists and functions.

3. Parametricity applied
3.1 Reaarangements
3.2 Fold

Prelude> :type foldr
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b

