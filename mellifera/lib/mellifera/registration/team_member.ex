defmodule Mellifera.Registration.TeamMember do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams_members" do
    field :team, :binary_id
    field :member, :binary_id

    timestamps()
  end

  @doc false
  def changeset(team_member, attrs) do
    team_member
    |> cast(attrs, [:team, :member])
    |> validate_required([:team, :member])
    |> unique_constraint([:team, :member])
  end
end
