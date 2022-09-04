defmodule Mellifera.RegistrationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mellifera.Registration` context.
  """

  @doc """
  Generate a participant.
  """
  def participant_fixture(attrs \\ %{}) do
    {:ok, participant} =
      attrs
      |> Enum.into(%{
        birth_date: ~D[2022-09-03],
        email: "some email",
        grad_year: 42,
        name: "some name",
        phone: "some phone"
      })
      |> Mellifera.Registration.create_participant()

    participant
  end

  @doc """
  Generate a org.
  """
  def org_fixture(attrs \\ %{}) do
    {:ok, org} =
      attrs
      |> Enum.into(%{
        address: [],
        contacts: %{},
        email: [],
        name: "some name",
        phone: []
      })
      |> Mellifera.Registration.create_org()

    org
  end
end
