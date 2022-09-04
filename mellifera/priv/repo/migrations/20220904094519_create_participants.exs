defmodule Mellifera.Repo.Migrations.CreateParticipants do
  use Ecto.Migration

  def change do
    create table(:participants, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:name, :string)
      add(:email, :string)
      add(:phone, :string)
      add(:birth_date, :date)
      add(:grad_year, :integer)

      timestamps()
    end
  end
end
