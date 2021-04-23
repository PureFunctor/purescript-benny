{ name = "benny"
, dependencies =
  [ "aff"
  , "aff-promise"
  , "effect"
  , "foldable-traversable"
  , "foreign"
  , "nullable"
  , "options"
  , "prelude"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
