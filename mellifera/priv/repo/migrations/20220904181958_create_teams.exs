defmodule Mellifera.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
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
    create(index(:teams, [:owner]))
  end
end
