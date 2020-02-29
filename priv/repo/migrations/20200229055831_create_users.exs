defmodule MusicUpdates.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :spotify_id, :string
      
      timestamps
    end
  end
end
