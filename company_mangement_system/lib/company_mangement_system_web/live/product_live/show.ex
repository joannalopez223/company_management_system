defmodule CompanyMangementSystemWeb.ProductLive.Show do
  use CompanyMangementSystemWeb, :live_view

  alias CompanyMangementSystem.StoreManagementSystem

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:product, StoreManagementSystem.get_product!(id))
     |> assign(:stores, StoreManagementSystem.list_stores())}

  end

  defp page_title(:show), do: "Show Product"
  defp page_title(:edit), do: "Edit Product"
end
