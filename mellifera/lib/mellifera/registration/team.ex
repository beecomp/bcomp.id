defmodule Mellifera.Registration.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams" do
    field :code, :string
    field :event, Ecto.Enum, values: [:mat, :ipa]
    field :name, :string
    field :status, Ecto.Enum, values: [:pending, :rejected, :approved]
    field :status_msg, :string
    field :org, :binary_id
    field :owner, :binary_id

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:event, :name, :code, :status, :status_msg])
    |> validate_required([:event, :name, :code, :status, :status_msg])
    |> unique_constraint(:owner)
  end
end
