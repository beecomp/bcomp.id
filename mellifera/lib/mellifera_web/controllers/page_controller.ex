defmodule MelliferaWeb.PageController do
  use MelliferaWeb, :controller
  import Gql.Sigil
  alias Plug.Conn

  alias Mellifera.CMS

  def index(conn, _params) do
    query = ~G"""
    {
      landing {
        description
        simple_schedule
        faq
            }
    }
    """

    {:ok, res} = CMS.req(query)

    render(
      conn
      |> Conn.assign(:description, res.landing.description)
      |> Conn.assign(
        :simple_schedule,
        res.landing.simple_schedule
        |> Enum.map(fn %{time: time} = m ->
          {:ok, time, _} = DateTime.from_iso8601(time)
          %{m | time: time}
        end)
      )
      |> Conn.assign(:faq, res.landing.faq),
      "landing.html"
    )
  end

  def blog(conn, _params) do
    query = ~G"""
    {
      posts {
        id
        handle
        title
        description
        user_created {
          first_name
          last_name
          avatar {
            id
            filename_download
            title
            description
          }
        }
        date_created
      }
    }
    """

    {:ok, res} = CMS.req(query)

    render(
      conn
      |> Conn.assign(
        :posts,
        res.posts
        |> Enum.map(fn post ->
          {:ok, date_created, _} = DateTime.from_iso8601(post.date_created)
          %{post | date_created: date_created}
        end)
      ),
      "blog.html"
    )
  end

  def post(conn, %{"id" => handle}) do
    query = ~G"""
    query ($handle: String!) {
      post: posts(filter: { handle: { _eq: $handle } }) {
        id
        handle
        date_created
        user_created {
          first_name
          last_name
          avatar {
            id
            filename_download
          }
        }
        header {
          id
          filename_download
        }
        title
        description
        content
      }
    }
    """

    {:ok, res} = CMS.req(query, handle: handle)
    [post] = res.post
    {:ok, date_created, _} = DateTime.from_iso8601(post.date_created)

    render(
      conn
      |> Conn.assign(:title, post.title)
      |> Conn.assign(:author, post.user_created)
      |> Conn.assign(:date, date_created)
      |> Conn.assign(:header, post.header)
      |> Conn.assign(:description, post.description)
      |> Conn.assign(:content, post.content),
      "post.html"
    )
  end
end
