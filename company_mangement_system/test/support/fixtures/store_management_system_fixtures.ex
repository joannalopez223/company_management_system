defmodule CompanyMangementSystem.StoreManagementSystemFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CompanyMangementSystem.StoreManagementSystem` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        location: ["option1", "option2"],
        store_id: 42
      })
      |> CompanyMangementSystem.StoreManagementSystem.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        inventoryCount: 42,
        retailPrice: 120.5,
        vendor: "some vendor",
        wholesalePrice: 120.5
      })
      |> CompanyMangementSystem.StoreManagementSystem.create_product()

    product
  end
end
