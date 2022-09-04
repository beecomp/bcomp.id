defmodule MelliferaWeb.TeamMemberLive.Index do
  use MelliferaWeb, :live_view

  alias Mellifera.Registration
  alias Mellifera.Registration.TeamMember

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :teams_members, list_teams_members())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Team member")
    |> assign(:team_member, Registration.get_team_member!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Team member")
    |> assign(:team_member, %TeamMember{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Teams members")
    |> assign(:team_member, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    team_member = Registration.get_team_member!(id)
    {:ok, _} = Registration.delete_team_member(team_member)

    {:noreply, assign(socket, :teams_members, list_teams_members())}
  end

  defp list_teams_members do
    Registration.list_teams_members()
  end
end
