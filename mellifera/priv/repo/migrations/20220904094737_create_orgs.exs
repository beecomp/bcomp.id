defmodule Mellifera.Repo.Migrations.CreateOrgs do
  use Ecto.Migration

  def change do
    create table(:orgs, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:name, :string)
      add(:address, {:array, :string})
      add(:email, {:array, :string})
      add(:phone, {:array, :string})
      add(:contacts, :map)

      timestamps()
    end
  end
end
