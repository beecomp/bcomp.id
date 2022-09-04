defmodule MelliferaWeb.ParticipantLiveTest do
  use MelliferaWeb.ConnCase

  import Phoenix.LiveViewTest
  import Mellifera.RegistrationFixtures

  @create_attrs %{birth_date: %{day: 3, month: 9, year: 2022}, email: "some email", grad_year: 42, name: "some name", phone: "some phone"}
  @update_attrs %{birth_date: %{day: 4, month: 9, year: 2022}, email: "some updated email", grad_year: 43, name: "some updated name", phone: "some updated phone"}
  @invalid_attrs %{birth_date: %{day: 30, month: 2, year: 2022}, email: nil, grad_year: nil, name: nil, phone: nil}

  defp create_participant(_) do
    participant = participant_fixture()
    %{participant: participant}
  end

  describe "Index" do
    setup [:create_participant]

    test "lists all participants", %{conn: conn, participant: participant} do
      {:ok, _index_live, html} = live(conn, Routes.participant_index_path(conn, :index))

      assert html =~ "Listing Participants"
      assert html =~ participant.email
    end

    test "saves new participant", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.participant_index_path(conn, :index))

      assert index_live |> element("a", "New Participant") |> render_click() =~
               "New Participant"

      assert_patch(index_live, Routes.participant_index_path(conn, :new))

      assert index_live
             |> form("#participant-form", participant: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#participant-form", participant: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.participant_index_path(conn, :index))

      assert html =~ "Participant created successfully"
      assert html =~ "some email"
    end

    test "updates participant in listing", %{conn: conn, participant: participant} do
      {:ok, index_live, _html} = live(conn, Routes.participant_index_path(conn, :index))

      assert index_live |> element("#participant-#{participant.id} a", "Edit") |> render_click() =~
               "Edit Participant"

      assert_patch(index_live, Routes.participant_index_path(conn, :edit, participant))

      assert index_live
             |> form("#participant-form", participant: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#participant-form", participant: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.participant_index_path(conn, :index))

      assert html =~ "Participant updated successfully"
      assert html =~ "some updated email"
    end

    test "deletes participant in listing", %{conn: conn, participant: participant} do
      {:ok, index_live, _html} = live(conn, Routes.participant_index_path(conn, :index))

      assert index_live |> element("#participant-#{participant.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#participant-#{participant.id}")
    end
  end

  describe "Show" do
    setup [:create_participant]

    test "displays participant", %{conn: conn, participant: participant} do
      {:ok, _show_live, html} = live(conn, Routes.participant_show_path(conn, :show, participant))

      assert html =~ "Show Participant"
      assert html =~ participant.email
    end

    test "updates participant within modal", %{conn: conn, participant: participant} do
      {:ok, show_live, _html} = live(conn, Routes.participant_show_path(conn, :show, participant))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Participant"

      assert_patch(show_live, Routes.participant_show_path(conn, :edit, participant))

      assert show_live
             |> form("#participant-form", participant: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#participant-form", participant: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.participant_show_path(conn, :show, participant))

      assert html =~ "Participant updated successfully"
      assert html =~ "some updated email"
    end
  end
end
