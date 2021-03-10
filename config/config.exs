# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pecora,
  ecto_repos: [Pecora.Repo]

# Configures the endpoint
config :pecora, PecoraWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QQd5RMmE5MQZrtUt9F8Z5x3IwaADg15wunWXnZWcnmZtXFw5LS4pbI7pNJHE1UIe",
  render_errors: [view: PecoraWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pecora.PubSub,
  live_view: [signing_salt: "sHxiR0KS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
