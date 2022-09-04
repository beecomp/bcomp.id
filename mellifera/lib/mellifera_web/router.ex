defmodule MelliferaWeb.Router do
  use MelliferaWeb, :router
  use Kaffy.Routes, scope: "/admin"

  pipeline :fetch_user do
    plug(Mellifera.Account.Pipeline)
  end

  pipeline :require_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {MelliferaWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)

    plug(:fetch_user)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", MelliferaWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/blog", PageController, :blog)
    get("/blog/:id", PageController, :post)

    live_session :default, on_mount: Mellifera.Account.AuthLive do
      live("/settings/user", UserLive.Show, :show)
      live("/settings/user/edit", UserLive.Show, :edit)

      live("/participants", ParticipantLive.Index, :index)
      live("/participants/new", ParticipantLive.Index, :new)
      live("/participants/:id/edit", ParticipantLive.Index, :edit)

      live("/participants/:id", ParticipantLive.Show, :show)
      live("/participants/:id/show/edit", ParticipantLive.Show, :edit)

      live("/orgs", OrgLive.Index, :index)
      live("/orgs/new", OrgLive.Index, :new)
      live("/orgs/:id/edit", OrgLive.Index, :edit)

      live("/orgs/:id", OrgLive.Show, :show)
      live("/orgs/:id/show/edit", OrgLive.Show, :edit)

      live("/teams", TeamLive.Index, :index)
      live("/teams/new", TeamLive.Index, :new)
      live("/teams/:id/edit", TeamLive.Index, :edit)

      live("/teams/:id", TeamLive.Show, :show)
      live("/teams/:id/show/edit", TeamLive.Show, :edit)
    end
  end

  if Mix.env() == :dev do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      forward("/mailbox", Plug.Swoosh.MailboxPreview)
      live_dashboard("/dashboard", metrics: MelliferaWeb.Telemetry)
    end
  end

  scope "/auth", MelliferaWeb do
    pipe_through(:browser)

    get("/logout", AuthController, :logout)
    get("/:provider", AuthController, :request)
    get("/:provider/callback", AuthController, :callback)
  end
end
