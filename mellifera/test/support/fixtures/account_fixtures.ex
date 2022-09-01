defmodule Mellifera.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mellifera.Account` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique user username.
  """
  def unique_user_username, do: "some username#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        roles: [],
        username: unique_user_username()
      })
      |> Mellifera.Account.create_user()

    user
  end

  @doc """
  Generate a unique login uid.
  """
  def unique_login_uid, do: "some uid#{System.unique_integer([:positive])}"

  @doc """
  Generate a login.
  """
  def login_fixture(attrs \\ %{}) do
    {:ok, login} =
      attrs
      |> Enum.into(%{
        extra: %{},
        uid: unique_login_uid()
      })
      |> Mellifera.Account.create_login()

    login
  end
end
