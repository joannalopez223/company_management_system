defmodule CompanyMangementSystem.StoreManagementSystem.Store do
  use Ecto.Schema
  import Ecto.Changeset

  alias CompanyMangementSystem.StoreManagementSystem.Product

  schema "stores" do
    field :location, :string
    field :store_id, :integer
    has_many :products, Product
    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:location, :store_id])
    # removed location from validate required for testing, trying to make location a array or strings
    |> validate_required([:store_id])
  end
end
