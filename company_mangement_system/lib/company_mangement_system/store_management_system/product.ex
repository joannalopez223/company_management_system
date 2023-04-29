defmodule CompanyMangementSystem.StoreManagementSystem.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias CompanyMangementSystem.StoreManagementSystem.Store
  schema "products" do
    field :inventoryCount, :integer
    field :retailPrice, :float
    field :vendor, :string
    field :wholesalePrice, :float
    field :name, :string
    belongs_to :store, Store
    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:vendor, :wholesalePrice, :retailPrice, :inventoryCount, :store_id, :name])
    |> validate_required([:vendor, :wholesalePrice, :retailPrice, :inventoryCount, :store_id, :name])
  end
end
