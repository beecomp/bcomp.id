defmodule MelliferaWeb.OrgLiveTest do
  use MelliferaWeb.ConnCase

  import Phoenix.LiveViewTest
  import Mellifera.RegistrationFixtures

  @create_attrs %{addresses: [], contacts: [], emails: [], name: "some name", phones: []}
  @update_attrs %{addresses: [], contacts: [], emails: [], name: "some updated name", phones: []}
  @invalid_attrs %{addresses: [], contacts: [], emails: [], name: nil, phones: []}

  defp create_org(_) do
    org = org_fixture()
    %{org: org}
  end

  describe "Index" do
    setup [:create_org]

    test "lists all orgs", %{conn: conn, org: org} do
      {:ok, _index_live, html} = live(conn, Routes.org_index_path(conn, :index))

      assert html =~ "Listing Orgs"
      assert html =~ org.name
    end

    test "saves new org", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.org_index_path(conn, :index))

      assert index_live |> element("a", "New Org") |> render_click() =~
               "New Org"

      assert_patch(index_live, Routes.org_index_path(conn, :new))

      assert index_live
             |> form("#org-form", org: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#org-form", org: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.org_index_path(conn, :index))

      assert html =~ "Org created successfully"
      assert html =~ "some name"
    end

    test "updates org in listing", %{conn: conn, org: org} do
      {:ok, index_live, _html} = live(conn, Routes.org_index_path(conn, :index))

      assert index_live |> element("#org-#{org.id} a", "Edit") |> render_click() =~
               "Edit Org"

      assert_patch(index_live, Routes.org_index_path(conn, :edit, org))

      assert index_live
             |> form("#org-form", org: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#org-form", org: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.org_index_path(conn, :index))

      assert html =~ "Org updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes org in listing", %{conn: conn, org: org} do
      {:ok, index_live, _html} = live(conn, Routes.org_index_path(conn, :index))

      assert index_live |> element("#org-#{org.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#org-#{org.id}")
    end
  end

  describe "Show" do
    setup [:create_org]

    test "displays org", %{conn: conn, org: org} do
      {:ok, _show_live, html} = live(conn, Routes.org_show_path(conn, :show, org))

      assert html =~ "Show Org"
      assert html =~ org.name
    end

    test "updates org within modal", %{conn: conn, org: org} do
      {:ok, show_live, _html} = live(conn, Routes.org_show_path(conn, :show, org))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Org"

      assert_patch(show_live, Routes.org_show_path(conn, :edit, org))

      assert show_live
             |> form("#org-form", org: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#org-form", org: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.org_show_path(conn, :show, org))

      assert html =~ "Org updated successfully"
      assert html =~ "some updated name"
    end
  end
end
