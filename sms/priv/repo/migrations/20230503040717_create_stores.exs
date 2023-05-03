defmodule Sms.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :storeID, :integer
      add :location, :string

      timestamps()
    end
  end
end
