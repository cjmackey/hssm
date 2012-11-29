module Main where

import Test.Framework (Test, defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2 (testProperty)
import Test.QuickCheck
import Test.HUnit ((@?=))
import Test.HUnit.Lang (Assertion)

import Data.List

data ImportLine = ImportLine String
                deriving (Eq, Ord, Show)

data InPortDescription = InPortDescription String String String
                deriving (Eq, Ord, Show)

parseImport s =
  case words s of
    ("import":_) -> Just (ImportLine s)
    _ -> Nothing
parseInPort s =
  case filter (\x -> length x > 0) (words s) of
    ("InPort":name:step:xs) -> Just (InPortDescription name step (concat $ intersperse " " xs))
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
    , testCase "something" (parseInPort "InPort somename somefun sometype" @?= Just (InPortDescription "somename" "somefun" "sometype"))
    ]
  ]

