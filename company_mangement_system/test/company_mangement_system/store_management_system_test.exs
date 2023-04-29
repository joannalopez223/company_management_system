defmodule CompanyMangementSystem.StoreManagementSystemTest do
  use CompanyMangementSystem.DataCase

  alias CompanyMangementSystem.StoreManagementSystem

  describe "stores" do
    alias CompanyMangementSystem.StoreManagementSystem.Store

    import CompanyMangementSystem.StoreManagementSystemFixtures

    @invalid_attrs %{location: nil, store_id: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert StoreManagementSystem.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert StoreManagementSystem.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{location: ["option1", "option2"], store_id: 42}

      assert {:ok, %Store{} = store} = StoreManagementSystem.create_store(valid_attrs)
      assert store.location == ["option1", "option2"]
      assert store.store_id == 42
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoreManagementSystem.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{location: ["option1"], store_id: 43}

      assert {:ok, %Store{} = store} = StoreManagementSystem.update_store(store, update_attrs)
      assert store.location == ["option1"]
      assert store.store_id == 43
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = StoreManagementSystem.update_store(store, @invalid_attrs)
      assert store == StoreManagementSystem.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = StoreManagementSystem.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> StoreManagementSystem.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = StoreManagementSystem.change_store(store)
    end
  end

  describe "products" do
    alias CompanyMangementSystem.StoreManagementSystem.Product

    import CompanyMangementSystem.StoreManagementSystemFixtures

    @invalid_attrs %{inventoryCount: nil, retailPrice: nil, vendor: nil, wholesalePrice: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert StoreManagementSystem.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert StoreManagementSystem.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{inventoryCount: 42, retailPrice: 120.5, vendor: "some vendor", wholesalePrice: 120.5}

      assert {:ok, %Product{} = product} = StoreManagementSystem.create_product(valid_attrs)
      assert product.inventoryCount == 42
      assert product.retailPrice == 120.5
      assert product.vendor == "some vendor"
      assert product.wholesalePrice == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoreManagementSystem.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{inventoryCount: 43, retailPrice: 456.7, vendor: "some updated vendor", wholesalePrice: 456.7}

      assert {:ok, %Product{} = product} = StoreManagementSystem.update_product(product, update_attrs)
      assert product.inventoryCount == 43
      assert product.retailPrice == 456.7
      assert product.vendor == "some updated vendor"
      assert product.wholesalePrice == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = StoreManagementSystem.update_product(product, @invalid_attrs)
      assert product == StoreManagementSystem.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = StoreManagementSystem.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> StoreManagementSystem.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = StoreManagementSystem.change_product(product)
    end
  end
end
