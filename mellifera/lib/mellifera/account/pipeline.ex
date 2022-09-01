defmodule Mellifera.Account.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :mellifera,
    error_handler: Mellifera.Account.ErrorHandler,
    module: Mellifera.Account.Guardian

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
  plug :fetch_user

  def fetch_user(conn, _opts) do
    conn
    |> assign(
      :current_user,
      Guardian.Plug.current_resource(conn)
    )
  end
end
