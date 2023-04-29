defmodule StoreManagerSystem.CompanyResourcesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StoreManagerSystem.CompanyResources` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        city: "some city",
        state: "some state",
        storeNumber: 42,
        street: "some street",
        zipcod: 42
      })
      |> StoreManagerSystem.CompanyResources.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        inventorycount: 42,
        name: "some name",
        retailPrice: 120.5,
        vendor: "some vendor",
        wholeSalePrice: 120.5
      })
      |> StoreManagerSystem.CompanyResources.create_product()

    product
  end
end
