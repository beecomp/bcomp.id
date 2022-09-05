defmodule Mellifera.Registration.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams" do
    field :event, Ecto.Enum, values: [:mat, :ipa]
    field :name, :string
    field :code, :string
    field :status, Ecto.Enum, values: [:draft, :pending, :rejected, :approved]
    field :status_msg, :string
    field :org, :binary_id
    field :owner, :binary_id

    many_to_many(
      :members,
      Mellifera.Registration.Participant,
      join_through: Mellifera.Registration.TeamMember
    )

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:event, :name, :code, :status, :status_msg])
    |> validate_required([:event, :name, :code, :status, :status_msg])
  end
end
