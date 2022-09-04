defmodule Mellifera.RegistrationTest do
  use Mellifera.DataCase

  alias Mellifera.Registration

  describe "participants" do
    alias Mellifera.Registration.Participant

    import Mellifera.RegistrationFixtures

    @invalid_attrs %{birth_date: nil, email: nil, grad_year: nil, name: nil, phone: nil}

    test "list_participants/0 returns all participants" do
      participant = participant_fixture()
      assert Registration.list_participants() == [participant]
    end

    test "get_participant!/1 returns the participant with given id" do
      participant = participant_fixture()
      assert Registration.get_participant!(participant.id) == participant
    end

    test "create_participant/1 with valid data creates a participant" do
      valid_attrs = %{birth_date: ~D[2022-09-03], email: "some email", grad_year: 42, name: "some name", phone: "some phone"}

      assert {:ok, %Participant{} = participant} = Registration.create_participant(valid_attrs)
      assert participant.birth_date == ~D[2022-09-03]
      assert participant.email == "some email"
      assert participant.grad_year == 42
      assert participant.name == "some name"
      assert participant.phone == "some phone"
    end

    test "create_participant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Registration.create_participant(@invalid_attrs)
    end

    test "update_participant/2 with valid data updates the participant" do
      participant = participant_fixture()
      update_attrs = %{birth_date: ~D[2022-09-04], email: "some updated email", grad_year: 43, name: "some updated name", phone: "some updated phone"}

      assert {:ok, %Participant{} = participant} = Registration.update_participant(participant, update_attrs)
      assert participant.birth_date == ~D[2022-09-04]
      assert participant.email == "some updated email"
      assert participant.grad_year == 43
      assert participant.name == "some updated name"
      assert participant.phone == "some updated phone"
    end

    test "update_participant/2 with invalid data returns error changeset" do
      participant = participant_fixture()
      assert {:error, %Ecto.Changeset{}} = Registration.update_participant(participant, @invalid_attrs)
      assert participant == Registration.get_participant!(participant.id)
    end

    test "delete_participant/1 deletes the participant" do
      participant = participant_fixture()
      assert {:ok, %Participant{}} = Registration.delete_participant(participant)
      assert_raise Ecto.NoResultsError, fn -> Registration.get_participant!(participant.id) end
    end

    test "change_participant/1 returns a participant changeset" do
      participant = participant_fixture()
      assert %Ecto.Changeset{} = Registration.change_participant(participant)
    end
  end

  describe "orgs" do
    alias Mellifera.Registration.Org

    import Mellifera.RegistrationFixtures

    @invalid_attrs %{address: nil, contacts: nil, email: nil, name: nil, phone: nil}

    test "list_orgs/0 returns all orgs" do
      org = org_fixture()
      assert Registration.list_orgs() == [org]
    end

    test "get_org!/1 returns the org with given id" do
      org = org_fixture()
      assert Registration.get_org!(org.id) == org
    end

    test "create_org/1 with valid data creates a org" do
      valid_attrs = %{address: [], contacts: %{}, email: [], name: "some name", phone: []}

      assert {:ok, %Org{} = org} = Registration.create_org(valid_attrs)
      assert org.address == []
      assert org.contacts == %{}
      assert org.email == []
      assert org.name == "some name"
      assert org.phone == []
    end

    test "create_org/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Registration.create_org(@invalid_attrs)
    end

    test "update_org/2 with valid data updates the org" do
      org = org_fixture()
      update_attrs = %{address: [], contacts: %{}, email: [], name: "some updated name", phone: []}

      assert {:ok, %Org{} = org} = Registration.update_org(org, update_attrs)
      assert org.address == []
      assert org.contacts == %{}
      assert org.email == []
      assert org.name == "some updated name"
      assert org.phone == []
    end

    test "update_org/2 with invalid data returns error changeset" do
      org = org_fixture()
      assert {:error, %Ecto.Changeset{}} = Registration.update_org(org, @invalid_attrs)
      assert org == Registration.get_org!(org.id)
    end

    test "delete_org/1 deletes the org" do
      org = org_fixture()
      assert {:ok, %Org{}} = Registration.delete_org(org)
      assert_raise Ecto.NoResultsError, fn -> Registration.get_org!(org.id) end
    end

    test "change_org/1 returns a org changeset" do
      org = org_fixture()
      assert %Ecto.Changeset{} = Registration.change_org(org)
    end
  end
end
