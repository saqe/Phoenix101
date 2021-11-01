# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pheonix101,
  ecto_repos: [Pheonix101.Repo]

# Configures the endpoint
config :pheonix101, Pheonix101Web.Endpoint,
  url: [host: "localhost"],
  # Hide the secret_key part of your app. That was mentioned so you can run the app easily in first go without error.
  secret_key_base: "MpC3ovyzYPiOD7K7DPWgLH4r/3yMv+6ZqaSledHnMptdKgN1T93iht0yWcCxx56L",
  render_errors: [view: Pheonix101Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pheonix101.PubSub,
  live_view: [signing_salt: "XH/Ka7EG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
