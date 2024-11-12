defmodule LPCrib.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :id, :string

      timestamps(type: :utc_datetime_usec)
    end
  end
end
