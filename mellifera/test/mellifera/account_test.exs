defmodule Mellifera.AccountTest do
  use Mellifera.DataCase

  alias Mellifera.Account

  describe "users" do
    alias Mellifera.Account.User

    import Mellifera.AccountFixtures

    @invalid_attrs %{email: nil, roles: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", roles: [], username: "some username"}

      assert {:ok, %User{} = user} = Account.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.roles == []
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", roles: [], username: "some updated username"}

      assert {:ok, %User{} = user} = Account.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.roles == []
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end

  describe "logins" do
    alias Mellifera.Account.Login

    import Mellifera.AccountFixtures

    @invalid_attrs %{extra: nil, uid: nil}

    test "list_logins/0 returns all logins" do
      login = login_fixture()
      assert Account.list_logins() == [login]
    end

    test "get_login!/1 returns the login with given id" do
      login = login_fixture()
      assert Account.get_login!(login.id) == login
    end

    test "create_login/1 with valid data creates a login" do
      valid_attrs = %{extra: %{}, uid: "some uid"}

      assert {:ok, %Login{} = login} = Account.create_login(valid_attrs)
      assert login.extra == %{}
      assert login.uid == "some uid"
    end

    test "create_login/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_login(@invalid_attrs)
    end

    test "update_login/2 with valid data updates the login" do
      login = login_fixture()
      update_attrs = %{extra: %{}, uid: "some updated uid"}

      assert {:ok, %Login{} = login} = Account.update_login(login, update_attrs)
      assert login.extra == %{}
      assert login.uid == "some updated uid"
    end

    test "update_login/2 with invalid data returns error changeset" do
      login = login_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_login(login, @invalid_attrs)
      assert login == Account.get_login!(login.id)
    end

    test "delete_login/1 deletes the login" do
      login = login_fixture()
      assert {:ok, %Login{}} = Account.delete_login(login)
      assert_raise Ecto.NoResultsError, fn -> Account.get_login!(login.id) end
    end

    test "change_login/1 returns a login changeset" do
      login = login_fixture()
      assert %Ecto.Changeset{} = Account.change_login(login)
    end
  end
end
