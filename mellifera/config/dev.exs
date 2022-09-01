import Config

# Configure your database
config :mellifera, Mellifera.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "mellifera_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with esbuild to bundle .js and .css sources.
config :mellifera, MelliferaWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "4YDSjqcGQsfya6AGPSXGHMvVB2jOiHRJd82T+jEhrdSJGDqv9yvlFsvBepBgTbYr",
  watchers: [
    # Start the esbuild watcher by calling Esbuild.install_and_run(:default, args)
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ]

config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
  domain: "fivein.auth0.com",
  client_id: "LxRSkn133Rmo9VtJbTui0eFi66iTgIbN",
  client_secret: "RRECjdXoOrc-cPHFA1mbB01uB4wiNSAKotWSdMLA7bwubuU94gWyQeUOHBggHaft"

# Configures guardian
config :mellifera, Mellifera.Account.Guardian,
  issuer: "mellifera",
  secret_key: "CQQ+QAcAYGt5+EJwTIae+1DX4v/2lrIratSDciJ4ENVQhbfy+uLHQ3b+BKCqmwGe"

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :mellifera, MelliferaWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/mellifera_web/(live|views)/.*(ex)$",
      ~r"lib/mellifera_web/templates/.*(eex)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
