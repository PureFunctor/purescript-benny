module Benchmark.Benny.Impl where

import Prelude hiding (add)

import Benchmark.Benny.Types (CompleteFn, CycleFn, SaveOptions, SuiteFn, Summary)
import Benchmarks.Benny.Utils (fnToEffect)
import Control.Promise (Promise)
import Control.Promise as Promise
import Data.Nullable (Nullable, notNull, null)
import Data.Options (Options(..), options)
import Data.Traversable (traverse)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Foreign (Foreign)


foreign import addImpl :: String -> Effect Unit -> Effect (Promise SuiteFn)

add :: String -> Effect Unit -> Aff SuiteFn
add name = Promise.toAffE <<< addImpl name

addFn :: forall r. String -> (Unit -> r) -> Aff SuiteFn
addFn name = Promise.toAffE <<< addImpl name <<< fnToEffect


foreign import addOnlyImpl :: String -> Effect Unit -> Effect (Promise SuiteFn)

addOnly :: String -> Effect Unit -> Aff SuiteFn
addOnly name = Promise.toAffE <<< addOnlyImpl name

addOnlyFn :: forall r. String -> (Unit -> r) -> Aff SuiteFn
addOnlyFn name = Promise.toAffE <<< addOnlyImpl name <<< fnToEffect


foreign import addSkipImpl :: String -> Effect Unit -> Effect (Promise SuiteFn)

addSkip :: String -> Effect Unit -> Aff SuiteFn
addSkip name = Promise.toAffE <<< addSkipImpl name

addSkipFn :: forall r. String -> (Unit -> r) -> Aff SuiteFn
addSkipFn name = Promise.toAffE <<< addSkipImpl name <<< fnToEffect


foreign import cycleImpl :: Nullable CycleFn -> Effect (Promise SuiteFn)

cycle_ :: Aff SuiteFn
cycle_ = Promise.toAffE $ cycleImpl null

cycle :: CycleFn -> Aff SuiteFn
cycle = Promise.toAffE <<< cycleImpl <<< notNull


foreign import completeImpl :: Nullable CompleteFn -> Effect (Promise SuiteFn)

complete_ :: Aff SuiteFn
complete_ = Promise.toAffE $ completeImpl null

complete :: CompleteFn -> Aff SuiteFn
complete = Promise.toAffE <<< completeImpl <<< notNull


foreign import saveImpl :: Foreign -> Effect (Promise SuiteFn)

save_ :: Aff SuiteFn
save_ = Promise.toAffE $ saveImpl ( options $ Options [ ] )

save :: Options SaveOptions -> Aff SuiteFn
save = Promise.toAffE <<< saveImpl <<< options


foreign import suiteImpl :: String -> Array (Promise SuiteFn) -> Effect (Promise Summary)

suite :: String -> Array (Aff SuiteFn) -> Effect Unit
suite name suiteFns_ = launchAff_ =<< do
  suiteFns <- traverse Promise.fromAff suiteFns_
  Promise.toAff <$> suiteImpl name suiteFns

