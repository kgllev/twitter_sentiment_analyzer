import Config

config :backpressure, :ecto_repos, [Backpressure.Repo] # Required for Mix tasks, such as mix ecto.gen.migration


config :backpressure, Backpressure.Repo,[
  adapter: Ecto.Adapters.Postgres,
  database: "backpressure_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 50
]


#import_config "#{Mix.env}.exs"
