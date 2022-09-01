defmodule MelliferaWeb.AuthController do
  use MelliferaWeb, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias Mellifera.{Account, Account.Guardian}

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "failed to authenticate")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    conn
    |> Guardian.Plug.sign_in(
      Account.login_or_create(
        uid: auth.uid,
        username: Base.encode16(:crypto.strong_rand_bytes(16), case: :lower),
        email: auth.info.email
      )
    )
    |> put_flash(:info, "authenticated")
    |> redirect(to: "/")
  end

  def logout(conn, _params) do
    conn
    |> Guardian.Plug.sign_out()
    |> put_flash(:info, "logged out")
    |> redirect(to: "/")
  end
end
