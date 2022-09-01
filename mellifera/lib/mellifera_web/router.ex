defmodule MelliferaWeb.Router do
  use MelliferaWeb, :router
  use Kaffy.Routes, scope: "/admin"

  pipeline :fetch_user do
    plug Mellifera.Account.Pipeline
  end

  pipeline :require_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {MelliferaWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    plug :fetch_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MelliferaWeb do
    pipe_through :browser

    get "/", PageController, :index

    live_session :default, on_mount: Mellifera.Account.AuthLive do
      live "/settings/user", UserLive.Show, :show
      live "/settings/user/edit", UserLive.Show, :edit

      live "/logins", LoginLive.Index, :index
      live "/logins/new", LoginLive.Index, :new
      live "/logins/:id/edit", LoginLive.Index, :edit

      live "/logins/:id", LoginLive.Show, :show
      live "/logins/:id/show/edit", LoginLive.Show, :edit
    end
  end

  # Enables LiveDashboard only for development
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MelliferaWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  scope "/auth", MelliferaWeb do
    pipe_through :browser

    get "/logout", AuthController, :logout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end
end
