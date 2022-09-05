defmodule Mellifera.Registration.Org do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orgs" do
    field :addresses, {:array, :string}
    field :contacts, {:array, :map}
    field :emails, {:array, :string}
    field :name, :string
    field :phones, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(org, attrs) do
    org
    |> cast(attrs, [:name, :addresses, :emails, :phones, :contacts])
    |> validate_required([:name, :addresses, :emails, :phones, :contacts])
  end
end
