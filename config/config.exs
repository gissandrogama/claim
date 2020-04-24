# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :claim,
  ecto_repos: [Claim.Repo]

# Configures the endpoint
config :claim, ClaimWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YwTahvzy9wKyhJR27EevWqdika3sgN8u2w7F8Z0sL8sW8G2QHjmTKEOaBmUc8dSh",
  render_errors: [view: ClaimWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Claim.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "6vdLPEDD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :claim, ClaimWeb.Guardian,
  issuer: "claim_web",
  secret_key: "OfwgzJo085F8LR5h//HG1s0hzLNUC2WT0jppYX07uraPIsMBpY3CrVyKy+nI+Tdy"

config :claim, ClaimWeb.AuthAccessPipeline,
  module: ClaimWeb.Guardian,
  error_handler: ClaimWeb.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
