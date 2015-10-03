{-# LANGUAGE DataKinds            #-}
{-# LANGUAGE TypeFamilies         #-}
{-# LANGUAGE TypeOperators        #-}
{-# LANGUAGE UndecidableInstances #-}

module Type where

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
