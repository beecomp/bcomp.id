defmodule Mellifera.Repo.Migrations.InitRegistration do
  use Ecto.Migration

  def change do
    create table(:orgs, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:name, :string)
      add(:addresses, {:array, :string})
      add(:emails, {:array, :string})
      add(:phones, {:array, :string})
      add(:contacts, {:array, :map})

      timestamps()
    end

    create table(:participants, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:name, :string)
      add(:email, :string)
      add(:phone, :string)
      add(:birth_date, :date)
      add(:grad_year, :integer)

      timestamps()
    end

    create table(:teams, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:event, :string)
      add(:name, :string)
      add(:code, :string)
      add(:status, :string)
      add(:status_msg, :string)
      add(:org, references(:orgs, on_delete: :nothing, type: :binary_id))
      add(:owner, references(:users, on_delete: :nothing, type: :binary_id))

      timestamps()
    end

    create(index(:teams, [:org]))
    create(unique_index(:teams, [:owner]))

    create table(:teams_members, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:team, references(:teams, on_delete: :nothing, type: :binary_id))
      add(:member, references(:participants, on_delete: :nothing, type: :binary_id))

      timestamps()
    end

    create(index(:teams_members, [:team]))
    create(index(:teams_members, [:member]))
    create(unique_index(:teams_members, [:team, :member]))
  end
end
