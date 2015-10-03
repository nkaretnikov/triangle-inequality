{-# LANGUAGE TemplateHaskell #-}

module Test where

import Data.Type.Equality

import Type
import TH

_3_4_5 ::
  Triangle (Succ (Succ (Succ Zero)))
           (Succ (Succ (Succ (Succ Zero))))
           (Succ (Succ (Succ (Succ (Succ Zero)))))
_3_4_5 = Refl

-- Doesn't typecheck.
-- _0_4_5 ::
--   Triangle Zero
--            (Succ (Succ (Succ (Succ Zero))))
--            (Succ (Succ (Succ (Succ (Succ Zero)))))
-- _0_4_5 = Refl

-- Inferred type:
-- 'True :~: 'True
_3_4_5' = $(triangle 3 4 5)

-- Which is the same as:
_3_4_5'' ::
  Triangle (Succ (Succ (Succ Zero)))
           (Succ (Succ (Succ (Succ Zero))))
           (Succ (Succ (Succ (Succ (Succ Zero)))))
_3_4_5'' = $(triangle 3 4 5)

-- Doesn't typecheck (as before).
-- _0_4_5 = $(triangle 0 4 5)
