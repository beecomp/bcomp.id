[
  plugins: [Phoenix.LiveView.HTMLFormatter, Gql.Formatter],
  import_deps: [:ecto, :phoenix],
  inputs: [
    "*.{heex,ex,exs}",
    "priv/*/seeds.exs",
    "priv/**/migrations/*.exs",
    "{config,lib,test}/**/*.{heex,ex,exs}"
  ]
]
