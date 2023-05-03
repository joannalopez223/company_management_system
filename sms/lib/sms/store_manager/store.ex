defmodule Sms.StoreManager.Store do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sms.StoreManager.Product

  schema "stores" do
    field :location, :string
    field :storeID, :integer
    has_many :products, Product

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:storeID, :location])
    |> validate_required([:storeID, :location])
  end
end
