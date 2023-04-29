defmodule CompanyMangementSystem.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :location, :string
      add :store_id, :integer
      

      timestamps()
    end
  end
end
