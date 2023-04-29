defmodule CompanyMangementSystemWeb.ProductLive.Index do
  use CompanyMangementSystemWeb, :live_view

  alias CompanyMangementSystem.StoreManagementSystem
  alias CompanyMangementSystem.Repo
  alias CompanyMangementSystem.StoreManagementSystem.Product

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :products, StoreManagementSystem.list_products())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Product")
    |> assign(:product, StoreManagementSystem.get_product!(id))
    |> assign(:stores, StoreManagementSystem.list_stores())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Product")
    |> assign(:product, %Product{})
    |> assign(:stores, StoreManagementSystem.list_stores())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Products")
    |> assign(:stores, StoreManagementSystem.list_products())
    |> assign(:product, nil)
  end

  @impl true
  def handle_info({CompanyMangementSystemWeb.ProductLive.FormComponent, {:saved, product}}, socket) do
    {:noreply, stream_insert(socket, :products, product)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    product = StoreManagementSystem.get_product!(id)
    {:ok, _} = StoreManagementSystem.delete_product(product)

    {:noreply, stream_delete(socket, :products, product)}
  end
end
