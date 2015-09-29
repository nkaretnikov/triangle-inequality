{-# LANGUAGE DataKinds            #-}
{-# LANGUAGE TypeFamilies         #-}
{-# LANGUAGE TypeOperators        #-}
{-# LANGUAGE UndecidableInstances #-}

module Main where

import Data.Proxy
import Data.Type.Equality

data Zero
data Succ n

type family Plus n m :: *
type instance Plus Zero     n = n
type instance Plus (Succ n) m = Succ (Plus n m)

type family LT n m :: Bool where
  LT Zero     (Succ m) = True
  LT (Succ n) (Succ m) = LT n m
  LT n        m        = False

type family And x y :: Bool where
  And True True = True
  And x    y    = False

type family Triangle a b c :: * where
  Triangle a b c =
    (And (LT c (Plus a b))
         (And (LT b (Plus a c))
              (LT a (Plus b c))))
    :~:
    True

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
