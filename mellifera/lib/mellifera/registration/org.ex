defmodule Mellifera.Registration.Org do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orgs" do
    field :address, {:array, :string}
    field :contacts, :map
    field :email, {:array, :string}
    field :name, :string
    field :phone, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(org, attrs) do
    org
    |> cast(attrs, [:name, :address, :email, :phone, :contacts])
    |> validate_required([:name, :address, :email, :phone, :contacts])
  end
end
