{-# LANGUAGE MultiParamTypeClasses #-}
module Data.HSSM.State where

import Data.HSSM.Message
import Data.Binary

{-

class (Binary s, HSSMMessage m) => State s m where
  step :: m -> s -> (s, [m])


data ExampleState = ExampleState Integer
data ExampleMessage = ExampleMessage Integer

instance Binary ExampleState where
  get = get >>= (\i -> return (ExampleState i))
  put (ExampleState i) = put i
instance Binary ExampleMessage where
  get = get >>= (\i -> return (ExampleMessage i))
  put (ExampleMessage i) = put i
instance HSSMMessage ExampleMessage


instance HSSMState ExampleState ExampleMessage where
  step (ExampleMessage m) (ExampleState s) = ((ExampleState (s+m)), [ExampleMessage (m-1)])

example = step (ExampleMessage 5) (ExampleState 4)

-}
