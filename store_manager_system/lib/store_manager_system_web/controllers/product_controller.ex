defmodule StoreManagerSystemWeb.ProductController do
  use StoreManagerSystemWeb, :controller

  alias StoreManagerSystem.CompanyResources
  alias StoreManagerSystem.CompanyResources.Product

  def index(conn, _params) do
    products = CompanyResources.list_products()
    render(conn, :index, products: products)
  end

  def new(conn, _params) do
    changeset = CompanyResources.change_product(%Product{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"product" => product_params}) do
    case CompanyResources.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: ~p"/products/#{product}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    product = CompanyResources.get_product!(id)
    render(conn, :show, product: product)
  end

  def edit(conn, %{"id" => id}) do
    product = CompanyResources.get_product!(id)
    changeset = CompanyResources.change_product(product)
    render(conn, :edit, product: product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = CompanyResources.get_product!(id)

    case CompanyResources.update_product(product, product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: ~p"/products/#{product}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = CompanyResources.get_product!(id)
    {:ok, _product} = CompanyResources.delete_product(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: ~p"/products")
  end
end
