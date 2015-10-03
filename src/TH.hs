{-# LANGUAGE TemplateHaskell #-}

module TH where

import Data.Type.Equality
import Language.Haskell.TH

import Type

triangle :: Int -> Int -> Int -> Q Exp
triangle a b c =
  [|Refl :: Triangle $(intToNat a) $(intToNat b) $(intToNat c)|]
  where
    intToNat :: Int -> Q Type
    intToNat 0 = [t|Zero|]
    intToNat n = [t|Succ $(intToNat $ pred n)|]
