# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :cloudyskies, CloudyskiesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XDbzib/9pNk7XmwbvexjE4Yyy2duqniEGISOfVEC9wbO453muLfuk2x4YcCNN2A7",
  render_errors: [view: CloudyskiesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cloudyskies.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure Darkskyx
config :darkskyx, 
  api_key: System.get_env("DARKSKY_API_KEY"),
  defaults: [
    units: "us",
    lang: "en"
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
