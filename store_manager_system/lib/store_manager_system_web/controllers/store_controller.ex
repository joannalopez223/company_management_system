defmodule StoreManagerSystemWeb.StoreController do
  use StoreManagerSystemWeb, :controller

  alias StoreManagerSystem.CompanyResources
  alias StoreManagerSystem.CompanyResources.Store

  def index(conn, _params) do
    stores = CompanyResources.list_stores()
    render(conn, :index, stores: stores)
  end

  def new(conn, _params) do
    changeset = CompanyResources.change_store(%Store{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"store" => store_params}) do
    case CompanyResources.create_store(store_params) do
      {:ok, store} ->
        conn
        |> put_flash(:info, "Store created successfully.")
        |> redirect(to: ~p"/stores/#{store}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    store = CompanyResources.get_store!(id)
    render(conn, :show, store: store)
  end

  def edit(conn, %{"id" => id}) do
    store = CompanyResources.get_store!(id)
    changeset = CompanyResources.change_store(store)
    render(conn, :edit, store: store, changeset: changeset)
  end

  def update(conn, %{"id" => id, "store" => store_params}) do
    store = CompanyResources.get_store!(id)

    case CompanyResources.update_store(store, store_params) do
      {:ok, store} ->
        conn
        |> put_flash(:info, "Store updated successfully.")
        |> redirect(to: ~p"/stores/#{store}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, store: store, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    store = CompanyResources.get_store!(id)
    {:ok, _store} = CompanyResources.delete_store(store)

    conn
    |> put_flash(:info, "Store deleted successfully.")
    |> redirect(to: ~p"/stores")
  end
end
