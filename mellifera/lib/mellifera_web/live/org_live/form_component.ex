defmodule MelliferaWeb.OrgLive.FormComponent do
  use MelliferaWeb, :live_component

  alias Mellifera.Registration

  @impl true
  def update(%{org: org} = assigns, socket) do
    changeset = Registration.change_org(org)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"org" => org_params}, socket) do
    changeset =
      socket.assigns.org
      |> Registration.change_org(org_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"org" => org_params}, socket) do
    save_org(socket, socket.assigns.action, org_params)
  end

  defp save_org(socket, :edit, org_params) do
    case Registration.update_org(socket.assigns.org, org_params) do
      {:ok, _org} ->
        {:noreply,
         socket
         |> put_flash(:info, "Org updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_org(socket, :new, org_params) do
    case Registration.create_org(org_params) do
      {:ok, _org} ->
        {:noreply,
         socket
         |> put_flash(:info, "Org created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
