defmodule Mellifera.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field(:email, :string)
    field(:username, :string)
    field(:roles, {:array, :string})

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :roles])
    |> validate_required([:username, :email, :roles])
    |> validate_format(:username, ~r/^[a-z0-9.\-_]*$/,
      message: "only lowercase alphabet, number, and . - _ are allowed"
    )
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end
end
