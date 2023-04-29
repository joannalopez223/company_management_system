defmodule StoreManagerSystem.CompanyResources.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :inventorycount, :integer
    field :name, :string
    field :retailPrice, :float
    field :vendor, :string
    field :wholeSalePrice, :float
    field :store_id, :id

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :vendor, :wholeSalePrice, :retailPrice, :inventorycount])
    |> validate_required([:name, :vendor, :wholeSalePrice, :retailPrice, :inventorycount])
  end
end
