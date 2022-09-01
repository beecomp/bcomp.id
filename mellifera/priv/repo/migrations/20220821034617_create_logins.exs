defmodule Mellifera.Repo.Migrations.CreateLogins do
  use Ecto.Migration

  def change do
    create table(:logins, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user, references(:users, on_delete: :nothing, type: :binary_id)
      add :uid, :string
      add :extra, :map

      timestamps()
    end

    create unique_index(:logins, [:uid])
    create index(:logins, [:user])
  end
end
