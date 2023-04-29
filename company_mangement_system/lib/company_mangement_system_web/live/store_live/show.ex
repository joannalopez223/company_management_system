defmodule CompanyMangementSystemWeb.StoreLive.Show do
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
     |> assign(:store, StoreManagementSystem.get_store!(id))
     |> assign(:products, StoreManagementSystem.list_products())
    }
  end

  defp page_title(:show), do: "Show Store"
  defp page_title(:edit), do: "Edit Store"
end
