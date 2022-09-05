defmodule MelliferaWeb.ParticipantLive.Index do
  use MelliferaWeb, :live_view

  alias Mellifera.Registration
  alias Mellifera.Registration.Participant

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :participants, list_participants())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Participant")
    |> assign(:participant, Registration.get_participant!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Participant")
    |> assign(:participant, %Participant{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Participants")
    |> assign(:participant, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    participant = Registration.get_participant!(id)
    {:ok, _} = Registration.delete_participant(participant)

    {:noreply, assign(socket, :participants, list_participants())}
  end

  defp list_participants do
    Registration.list_participants()
  end
end
