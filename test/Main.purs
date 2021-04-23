module Test.Main where

import Prelude

import Benchmark.Benny (addFn, addOnlyFn, addSkipFn, complete_, cycle_, save_, suite)
import Effect (Effect)


main :: Effect Unit
main = do
  suite "my test suite"
    [ addFn "1 + 1" \_ -> 1 + 1
    , addFn "2 + 2" \_ -> 2 + 2
    , addSkipFn "3 + 3" \_ -> 3 + 3
    , cycle_
    , complete_
    , save_
    ]
  suite "my other suite"
    [ addFn "1 + 1" \_ -> 1 + 1
    , addOnlyFn "3 + 3" \_ -> 3 + 3
    , cycle_
    , complete_
    , save_
    ]
