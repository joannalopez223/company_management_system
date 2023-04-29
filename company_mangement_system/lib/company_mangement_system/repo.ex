defmodule CompanyMangementSystem.Repo do
  use Ecto.Repo,
    otp_app: :company_mangement_system,
    adapter: Ecto.Adapters.Postgres
end
