defmodule Mellifera.Account.AuthLive do
  import Phoenix.LiveView
  alias Mellifera.Account.Guardian

  def on_mount(_, _params, %{"guardian_default_token" => user_token} = _session, socket) do
    socket =
      socket
      |> assign_new(:current_user, fn ->
        case Guardian.resource_from_token(user_token) do
          {:ok, resource, _claims} -> resource
          _ -> nil
        end
      end)

    {:cont, socket}
  end
end
