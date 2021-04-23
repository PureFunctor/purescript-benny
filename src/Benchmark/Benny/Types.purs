module Benchmark.Benny.Types where

import Data.Options (Option, opt)
import Data.Unit (Unit)
import Effect (Effect)


foreign import data SuiteFn :: Type
foreign import data Summary :: Type


type CaseResult =
  { name :: String
  , ops :: Number
  , margin :: Number
  -- , options :: Options
  , samples :: Number
  , promise :: Boolean
  , details ::
    { min :: Number
    , max :: Number
    , mean :: Number
    , median :: Number
    , standardDeviation :: Number
    , marginOfError :: Number
    , relativeMarginOfError :: Number
    , standardErrorOfMean :: Number
    , sampleVariance :: Number
    , sampleResults :: Array Number
    }
  , completed :: Boolean
}


type CycleFn = CaseResult -> Summary -> Effect Unit


type CompleteFn = Summary -> Effect Unit


data SaveOptions

file :: Option SaveOptions String
file = opt "file"

fileFn :: Option SaveOptions (Summary -> String)
fileFn = opt "fileFn"

folder :: Option SaveOptions String
folder = opt "folder"

version :: Option SaveOptions String
version = opt "version"

details :: Option SaveOptions String
details = opt "details"

format :: Option SaveOptions String
format = opt "format"
