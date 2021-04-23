module Benchmark.Benny
  ( module Benchmark.Benny.Impl
  , module Benchmark.Benny.Types
  , module Data.Options
  )
  where

import Data.Options ((:=))

import Benchmark.Benny.Impl (add, addFn, addOnly, addOnlyFn, addSkip, addSkipFn, complete, complete_, cycle, cycle_, save, save_, suite)
import Benchmark.Benny.Types (CaseResult, CompleteFn, CycleFn, SaveOptions, SuiteFn, Summary, details, file, fileFn, folder, format, version)
