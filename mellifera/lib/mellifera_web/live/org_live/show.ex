defmodule MelliferaWeb.OrgLive.Show do
  use MelliferaWeb, :live_view

  alias Mellifera.Registration

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:org, Registration.get_org!(id))}
  end

  defp page_title(:show), do: "Show Org"
  defp page_title(:edit), do: "Edit Org"
end