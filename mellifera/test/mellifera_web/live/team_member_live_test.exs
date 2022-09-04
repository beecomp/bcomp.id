defmodule MelliferaWeb.TeamMemberLiveTest do
  use MelliferaWeb.ConnCase

  import Phoenix.LiveViewTest
  import Mellifera.RegistrationFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_team_member(_) do
    team_member = team_member_fixture()
    %{team_member: team_member}
  end

  describe "Index" do
    setup [:create_team_member]

    test "lists all teams_members", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.team_member_index_path(conn, :index))

      assert html =~ "Listing Teams members"
    end

    test "saves new team_member", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.team_member_index_path(conn, :index))

      assert index_live |> element("a", "New Team member") |> render_click() =~
               "New Team member"

      assert_patch(index_live, Routes.team_member_index_path(conn, :new))

      assert index_live
             |> form("#team_member-form", team_member: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#team_member-form", team_member: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.team_member_index_path(conn, :index))

      assert html =~ "Team member created successfully"
    end

    test "updates team_member in listing", %{conn: conn, team_member: team_member} do
      {:ok, index_live, _html} = live(conn, Routes.team_member_index_path(conn, :index))

      assert index_live |> element("#team_member-#{team_member.id} a", "Edit") |> render_click() =~
               "Edit Team member"

      assert_patch(index_live, Routes.team_member_index_path(conn, :edit, team_member))

      assert index_live
             |> form("#team_member-form", team_member: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#team_member-form", team_member: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.team_member_index_path(conn, :index))

      assert html =~ "Team member updated successfully"
    end

    test "deletes team_member in listing", %{conn: conn, team_member: team_member} do
      {:ok, index_live, _html} = live(conn, Routes.team_member_index_path(conn, :index))

      assert index_live |> element("#team_member-#{team_member.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#team_member-#{team_member.id}")
    end
  end

  describe "Show" do
    setup [:create_team_member]

    test "displays team_member", %{conn: conn, team_member: team_member} do
      {:ok, _show_live, html} = live(conn, Routes.team_member_show_path(conn, :show, team_member))

      assert html =~ "Show Team member"
    end

    test "updates team_member within modal", %{conn: conn, team_member: team_member} do
      {:ok, show_live, _html} = live(conn, Routes.team_member_show_path(conn, :show, team_member))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Team member"

      assert_patch(show_live, Routes.team_member_show_path(conn, :edit, team_member))

      assert show_live
             |> form("#team_member-form", team_member: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#team_member-form", team_member: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.team_member_show_path(conn, :show, team_member))

      assert html =~ "Team member updated successfully"
    end
  end
end
