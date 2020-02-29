# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :music_updates,
  ecto_repos: [MusicUpdates.Repo],
  user_id: "jackmoch",
  scopes: ["playlist-read-private", "user-read-email", "user-read-private"],
  redirect_uri: "http://localhost:4000"
  
# Configures the endpoint
config :music_updates, MusicUpdatesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0yLcAJtcsygWNuM9+wUBo/m6Eb9I/OnAtdg3P6iyoooOmU94T4kAYPFGUH2p6/4y",
  render_errors: [view: MusicUpdatesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MusicUpdates.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "8ySp1FYh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


                                       # Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

