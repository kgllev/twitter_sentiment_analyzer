defmodule Backpressure.Repo do
  use Ecto.Repo,
      otp_app: :backpressure,
      adapter: Ecto.Adapters.Postgres
end
