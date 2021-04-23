module Benchmarks.Benny.Utils where

import Prelude

import Effect (Effect)


fnToEffect :: forall r. (Unit -> r) -> Effect Unit
fnToEffect cb = void $ pure $ cb unit
