module Data.HSSM.Message where

import Data.Binary

class (Binary m) => HSSMMessage m

