module Main where

import Test.Framework (Test, defaultMain, testGroup)
import Test.Framework.Providers.HUnit (testCase)
--import Test.Framework.Providers.QuickCheck2 (testProperty)
--import Test.QuickCheck
import Test.HUnit ((@?=))
--import Test.HUnit.Lang (Assertion)

import Data.Word (Word16)

type PortID = Word16

data ImportLine = ImportLine String
                deriving (Eq, Ord, Show)

data InPortDescription = InPortDescription PortID String String String
                deriving (Eq, Ord, Show)
data OutPortDescription = OutPortDescription PortID String String
                deriving (Eq, Ord, Show)

parseImport s =
  case words s of
    ("import":_) -> Just (ImportLine s)
    _ -> Nothing
parseInPort s =
  case filter (\x -> length x > 0) (words s) of
    ("InPort":ix:name:step:xs) -> Just (InPortDescription (read ix) name step (unwords xs))
    _ -> Nothing
parseOutPort s =
  case filter (\x -> length x > 0) (words s) of
    ("OutPort":ix:name:xs) -> Just (OutPortDescription (read ix) name (unwords xs))
    _ -> Nothing


main :: IO ()
main = defaultMain tests

tests :: [Test]
tests = 
  [ testGroup "parseImport"
    [ testCase "empty" (parseImport "" @?= Nothing)
    , testCase "something" (parseImport "import blah" @?= Just (ImportLine "import blah"))
    ]
  , testGroup "parseInPort"
    [ testCase "empty" (parseInPort "" @?= Nothing)
    , testCase "something" (parseInPort "InPort  5 somename    somefun sometype with spaces" @?= Just (InPortDescription 5 "somename" "somefun" "sometype with spaces"))
    ]
  , testGroup "parseOutPort"
    [ testCase "empty" (parseOutPort "" @?= Nothing)
    , testCase "something" (parseOutPort "OutPort 2 somename sometype and spaces " @?= Just (OutPortDescription 2 "somename" "sometype and spaces"))
    ]
  ]

