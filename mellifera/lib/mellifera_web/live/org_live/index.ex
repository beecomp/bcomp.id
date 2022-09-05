defmodule MelliferaWeb.OrgLive.Index do
  use MelliferaWeb, :live_view

  alias Mellifera.Registration
  alias Mellifera.Registration.Org

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :orgs, list_orgs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Org")
    |> assign(:org, Registration.get_org!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Org")
    |> assign(:org, %Org{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Orgs")
    |> assign(:org, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    org = Registration.get_org!(id)
    {:ok, _} = Registration.delete_org(org)

    {:noreply, assign(socket, :orgs, list_orgs())}
  end

  defp list_orgs do
    Registration.list_orgs()
  end
end
