defmodule MelliferaWeb.TeamLiveTest do
  use MelliferaWeb.ConnCase

  import Phoenix.LiveViewTest
  import Mellifera.RegistrationFixtures

  @create_attrs %{code: "some code", event: :mat, name: "some name", status: :pending, status_msg: "some status_msg"}
  @update_attrs %{code: "some updated code", event: :ipa, name: "some updated name", status: :rejected, status_msg: "some updated status_msg"}
  @invalid_attrs %{code: nil, event: nil, name: nil, status: nil, status_msg: nil}

  defp create_team(_) do
    team = team_fixture()
    %{team: team}
  end

  describe "Index" do
    setup [:create_team]

    test "lists all teams", %{conn: conn, team: team} do
      {:ok, _index_live, html} = live(conn, Routes.team_index_path(conn, :index))

      assert html =~ "Listing Teams"
      assert html =~ team.code
    end

    test "saves new team", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.team_index_path(conn, :index))

      assert index_live |> element("a", "New Team") |> render_click() =~
               "New Team"

      assert_patch(index_live, Routes.team_index_path(conn, :new))

      assert index_live
             |> form("#team-form", team: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#team-form", team: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.team_index_path(conn, :index))

      assert html =~ "Team created successfully"
      assert html =~ "some code"
    end

    test "updates team in listing", %{conn: conn, team: team} do
      {:ok, index_live, _html} = live(conn, Routes.team_index_path(conn, :index))

      assert index_live |> element("#team-#{team.id} a", "Edit") |> render_click() =~
               "Edit Team"

      assert_patch(index_live, Routes.team_index_path(conn, :edit, team))

      assert index_live
             |> form("#team-form", team: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#team-form", team: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.team_index_path(conn, :index))

      assert html =~ "Team updated successfully"
      assert html =~ "some updated code"
    end

    test "deletes team in listing", %{conn: conn, team: team} do
      {:ok, index_live, _html} = live(conn, Routes.team_index_path(conn, :index))

      assert index_live |> element("#team-#{team.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#team-#{team.id}")
    end
  end

  describe "Show" do
    setup [:create_team]

    test "displays team", %{conn: conn, team: team} do
      {:ok, _show_live, html} = live(conn, Routes.team_show_path(conn, :show, team))

      assert html =~ "Show Team"
      assert html =~ team.code
    end

    test "updates team within modal", %{conn: conn, team: team} do
      {:ok, show_live, _html} = live(conn, Routes.team_show_path(conn, :show, team))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Team"

      assert_patch(show_live, Routes.team_show_path(conn, :edit, team))

      assert show_live
             |> form("#team-form", team: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#team-form", team: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.team_show_path(conn, :show, team))

      assert html =~ "Team updated successfully"
      assert html =~ "some updated code"
    end
  end
end
