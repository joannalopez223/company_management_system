defmodule StoreManagerSystem.CompanyResourcesTest do
  use StoreManagerSystem.DataCase

  alias StoreManagerSystem.CompanyResources

  describe "stores" do
    alias StoreManagerSystem.CompanyResources.Store

    import StoreManagerSystem.CompanyResourcesFixtures

    @invalid_attrs %{city: nil, state: nil, storeNumber: nil, street: nil, zipcod: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert CompanyResources.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert CompanyResources.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{city: "some city", state: "some state", storeNumber: 42, street: "some street", zipcod: 42}

      assert {:ok, %Store{} = store} = CompanyResources.create_store(valid_attrs)
      assert store.city == "some city"
      assert store.state == "some state"
      assert store.storeNumber == 42
      assert store.street == "some street"
      assert store.zipcod == 42
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CompanyResources.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{city: "some updated city", state: "some updated state", storeNumber: 43, street: "some updated street", zipcod: 43}

      assert {:ok, %Store{} = store} = CompanyResources.update_store(store, update_attrs)
      assert store.city == "some updated city"
      assert store.state == "some updated state"
      assert store.storeNumber == 43
      assert store.street == "some updated street"
      assert store.zipcod == 43
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = CompanyResources.update_store(store, @invalid_attrs)
      assert store == CompanyResources.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = CompanyResources.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> CompanyResources.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = CompanyResources.change_store(store)
    end
  end

  describe "products" do
    alias StoreManagerSystem.CompanyResources.Product

    import StoreManagerSystem.CompanyResourcesFixtures

    @invalid_attrs %{inventorycount: nil, name: nil, retailPrice: nil, vendor: nil, wholeSalePrice: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert CompanyResources.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert CompanyResources.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{inventorycount: 42, name: "some name", retailPrice: 120.5, vendor: "some vendor", wholeSalePrice: 120.5}

      assert {:ok, %Product{} = product} = CompanyResources.create_product(valid_attrs)
      assert product.inventorycount == 42
      assert product.name == "some name"
      assert product.retailPrice == 120.5
      assert product.vendor == "some vendor"
      assert product.wholeSalePrice == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CompanyResources.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{inventorycount: 43, name: "some updated name", retailPrice: 456.7, vendor: "some updated vendor", wholeSalePrice: 456.7}

      assert {:ok, %Product{} = product} = CompanyResources.update_product(product, update_attrs)
      assert product.inventorycount == 43
      assert product.name == "some updated name"
      assert product.retailPrice == 456.7
      assert product.vendor == "some updated vendor"
      assert product.wholeSalePrice == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = CompanyResources.update_product(product, @invalid_attrs)
      assert product == CompanyResources.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = CompanyResources.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> CompanyResources.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = CompanyResources.change_product(product)
    end
  end
end
