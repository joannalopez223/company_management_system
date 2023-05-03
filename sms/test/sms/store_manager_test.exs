defmodule Sms.StoreManagerTest do
  use Sms.DataCase

  alias Sms.StoreManager

  describe "stores" do
    alias Sms.StoreManager.Store

    import Sms.StoreManagerFixtures

    @invalid_attrs %{location: nil, storeID: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert StoreManager.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert StoreManager.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{location: "some location", storeID: 42}

      assert {:ok, %Store{} = store} = StoreManager.create_store(valid_attrs)
      assert store.location == "some location"
      assert store.storeID == 42
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoreManager.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{location: "some updated location", storeID: 43}

      assert {:ok, %Store{} = store} = StoreManager.update_store(store, update_attrs)
      assert store.location == "some updated location"
      assert store.storeID == 43
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = StoreManager.update_store(store, @invalid_attrs)
      assert store == StoreManager.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = StoreManager.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> StoreManager.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = StoreManager.change_store(store)
    end
  end

  describe "products" do
    alias Sms.StoreManager.Product

    import Sms.StoreManagerFixtures

    @invalid_attrs %{inventory: nil, name: nil, retail_price: nil, vendor: nil, wholesale_price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert StoreManager.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert StoreManager.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{inventory: 42, name: "some name", retail_price: 120.5, vendor: "some vendor", wholesale_price: 120.5}

      assert {:ok, %Product{} = product} = StoreManager.create_product(valid_attrs)
      assert product.inventory == 42
      assert product.name == "some name"
      assert product.retail_price == 120.5
      assert product.vendor == "some vendor"
      assert product.wholesale_price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoreManager.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{inventory: 43, name: "some updated name", retail_price: 456.7, vendor: "some updated vendor", wholesale_price: 456.7}

      assert {:ok, %Product{} = product} = StoreManager.update_product(product, update_attrs)
      assert product.inventory == 43
      assert product.name == "some updated name"
      assert product.retail_price == 456.7
      assert product.vendor == "some updated vendor"
      assert product.wholesale_price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = StoreManager.update_product(product, @invalid_attrs)
      assert product == StoreManager.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = StoreManager.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> StoreManager.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = StoreManager.change_product(product)
    end
  end
end
