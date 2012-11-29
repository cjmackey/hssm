{-# LANGUAGE MultiParamTypeClasses #-}
module Data.HSSM.State where

import Data.HSSM.Message
import Data.Binary

class (Binary s, HSSMMessage m) => HSSMState s m where
  step :: m -> s -> s





