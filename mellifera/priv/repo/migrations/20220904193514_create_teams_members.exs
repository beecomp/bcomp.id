defmodule Mellifera.Repo.Migrations.CreateTeamsMembers do
  use Ecto.Migration

  def change do
    create table(:teams_members, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:team, references(:teams, on_delete: :nothing, type: :binary_id))
      add(:member, references(:participants, on_delete: :nothing, type: :binary_id))

      timestamps()
    end

    create(index(:teams_members, [:team]))
    create(index(:teams_members, [:member]))
  end
end
