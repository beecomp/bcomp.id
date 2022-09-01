defmodule Mellifera.Account.Login do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "logins" do
    field :extra, :map
    field :uid, :string
    field :user, :binary_id

    timestamps()
  end

  @doc false
  def changeset(login, attrs) do
    login
    |> cast(attrs, [:uid, :extra, :user])
    |> validate_required([:uid, :extra, :user])
    |> unique_constraint(:uid)
  end
end
