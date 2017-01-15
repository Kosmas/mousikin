# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mousikin,
  ecto_repos: [Mousikin.Repo]

# Configures the endpoint
config :mousikin, Mousikin.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kE/zH0+mXbuBvuYWS472iLWAXRU0QqalQjyrAtndxi+xTI9q7Qvrd882UMzP/UgD",
  render_errors: [view: Mousikin.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mousikin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Mousikin.User,
  repo: Mousikin.Repo,
  module: Mousikin,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, Mousikin.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
