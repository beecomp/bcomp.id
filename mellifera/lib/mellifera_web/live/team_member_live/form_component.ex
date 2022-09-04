defmodule MelliferaWeb.TeamMemberLive.FormComponent do
  use MelliferaWeb, :live_component

  alias Mellifera.Registration

  @impl true
  def update(%{team_member: team_member} = assigns, socket) do
    changeset = Registration.change_team_member(team_member)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"team_member" => team_member_params}, socket) do
    changeset =
      socket.assigns.team_member
      |> Registration.change_team_member(team_member_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"team_member" => team_member_params}, socket) do
    save_team_member(socket, socket.assigns.action, team_member_params)
  end

  defp save_team_member(socket, :edit, team_member_params) do
    case Registration.update_team_member(socket.assigns.team_member, team_member_params) do
      {:ok, _team_member} ->
        {:noreply,
         socket
         |> put_flash(:info, "Team member updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_team_member(socket, :new, team_member_params) do
    case Registration.create_team_member(team_member_params) do
      {:ok, _team_member} ->
        {:noreply,
         socket
         |> put_flash(:info, "Team member created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
