defmodule StoreManagerSystem.CompanyResources.Store do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field :city, :string
    field :state, :string
    field :storeNumber, :integer
    field :street, :string
    field :zipcod, :integer

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:street, :city, :state, :zipcod, :storeNumber])
    |> validate_required([:street, :city, :state, :zipcod, :storeNumber])
  end
end
