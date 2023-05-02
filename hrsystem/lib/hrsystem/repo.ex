defmodule Hrsystem.Repo do
  use Ecto.Repo,
    otp_app: :hrsystem,
    adapter: Ecto.Adapters.Postgres
end
