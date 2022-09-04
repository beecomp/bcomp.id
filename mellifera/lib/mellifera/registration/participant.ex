defmodule Mellifera.Registration.Participant do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "participants" do
    field :birth_date, :date
    field :email, :string
    field :grad_year, :integer
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(participant, attrs) do
    participant
    |> cast(attrs, [:name, :email, :phone, :birth_date, :grad_year])
    |> validate_required([:name, :email, :phone, :birth_date, :grad_year])
  end
end
