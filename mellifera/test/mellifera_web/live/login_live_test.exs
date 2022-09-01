defmodule MelliferaWeb.LoginLiveTest do
  use MelliferaWeb.ConnCase

  import Phoenix.LiveViewTest
  import Mellifera.AccountFixtures

  @create_attrs %{extra: %{}, uid: "some uid"}
  @update_attrs %{extra: %{}, uid: "some updated uid"}
  @invalid_attrs %{extra: nil, uid: nil}

  defp create_login(_) do
    login = login_fixture()
    %{login: login}
  end

  describe "Index" do
    setup [:create_login]

    test "lists all logins", %{conn: conn, login: login} do
      {:ok, _index_live, html} = live(conn, Routes.login_index_path(conn, :index))

      assert html =~ "Listing Logins"
      assert html =~ login.uid
    end

    test "saves new login", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.login_index_path(conn, :index))

      assert index_live |> element("a", "New Login") |> render_click() =~
               "New Login"

      assert_patch(index_live, Routes.login_index_path(conn, :new))

      assert index_live
             |> form("#login-form", login: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#login-form", login: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.login_index_path(conn, :index))

      assert html =~ "Login created successfully"
      assert html =~ "some uid"
    end

    test "updates login in listing", %{conn: conn, login: login} do
      {:ok, index_live, _html} = live(conn, Routes.login_index_path(conn, :index))

      assert index_live |> element("#login-#{login.id} a", "Edit") |> render_click() =~
               "Edit Login"

      assert_patch(index_live, Routes.login_index_path(conn, :edit, login))

      assert index_live
             |> form("#login-form", login: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#login-form", login: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.login_index_path(conn, :index))

      assert html =~ "Login updated successfully"
      assert html =~ "some updated uid"
    end

    test "deletes login in listing", %{conn: conn, login: login} do
      {:ok, index_live, _html} = live(conn, Routes.login_index_path(conn, :index))

      assert index_live |> element("#login-#{login.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#login-#{login.id}")
    end
  end

  describe "Show" do
    setup [:create_login]

    test "displays login", %{conn: conn, login: login} do
      {:ok, _show_live, html} = live(conn, Routes.login_show_path(conn, :show, login))

      assert html =~ "Show Login"
      assert html =~ login.uid
    end

    test "updates login within modal", %{conn: conn, login: login} do
      {:ok, show_live, _html} = live(conn, Routes.login_show_path(conn, :show, login))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Login"

      assert_patch(show_live, Routes.login_show_path(conn, :edit, login))

      assert show_live
             |> form("#login-form", login: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#login-form", login: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.login_show_path(conn, :show, login))

      assert html =~ "Login updated successfully"
      assert html =~ "some updated uid"
    end
  end
end
