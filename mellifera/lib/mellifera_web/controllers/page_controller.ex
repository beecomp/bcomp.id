defmodule MelliferaWeb.PageController do
  use MelliferaWeb, :controller
  alias Plug.Conn

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def landing(conn, _params) do
    {:ok, q1_day, _} = DateTime.from_iso8601("2022-09-17T16:59:00.000Z")

    render(
      conn
      |> Conn.assign(:event, %{
        schedule: %{
          simple: [
            %{
              event: "Deadline Penyisihan\u00a01",
              date: q1_day,
              icon: "fa-inbox"
            },
            %{
              event: "Deadline Penyisihan\u00a01",
              date: q1_day,
              icon: "fa-inbox"
            },
            %{
              event: "Deadline Penyisihan\u00a01",
              date: q1_day,
              icon: "fa-inbox"
            },
            %{
              event: "Deadline Penyisihan\u00a01",
              date: q1_day,
              icon: "fa-inbox"
            }
          ]
        }
      }),
      "landing.html"
    )
  end
end
