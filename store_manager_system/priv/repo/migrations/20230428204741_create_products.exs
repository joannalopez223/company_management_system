defmodule StoreManagerSystem.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :vendor, :string
      add :wholeSalePrice, :float
      add :retailPrice, :float
      add :inventorycount, :integer
      add :store_id, references(:stores, on_delete: :nothing)

      timestamps()
    end

    create index(:products, [:store_id])
  end
end
