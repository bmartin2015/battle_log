use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :battle_log, BattleLogWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :battle_log, BattleLog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "battle_log_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
