# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :mellifera,
  ecto_repos: [Mellifera.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :mellifera, MelliferaWeb.Endpoint,
  url: [host: "localhost"],
  static_url: [path: "/static"],
  render_errors: [view: MelliferaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Mellifera.PubSub,
  live_view: [signing_salt: "K+D5FEgY"]

# Configures kaffy
config :kaffy,
  otp_app: :mellifera,
  static_url: [path: "/static"],
  ecto_repo: Mellifera.Repo,
  router: MelliferaWeb.Router

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :mellifera, Mellifera.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures ueberauth
config :ueberauth, Ueberauth,
  providers: [
    auth0: {Ueberauth.Strategy.Auth0, []}
  ]

# Configures guardian
config :mellifera, Mellifera.Account.Guardian,
  issuer: "mellifera",
  secret_key: "CQQ+QAcAYGt5+EJwTIae+1DX4v/2lrIratSDciJ4ENVQhbfy+uLHQ3b+BKCqmwGe"

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.1.8",
  default: [
    args: ~w(
    --config=tailwind.config.js
    --input=css/app.css
    --output=../priv/static/assets/app.css
  ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
