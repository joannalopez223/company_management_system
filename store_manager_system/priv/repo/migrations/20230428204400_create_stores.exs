defmodule StoreManagerSystem.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :street, :string
      add :city, :string
      add :state, :string
      add :zipcod, :integer
      add :storeNumber, :integer

      timestamps()
    end
  end
end
