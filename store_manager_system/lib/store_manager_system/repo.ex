defmodule StoreManagerSystem.Repo do
  use Ecto.Repo,
    otp_app: :store_manager_system,
    adapter: Ecto.Adapters.Postgres
end
