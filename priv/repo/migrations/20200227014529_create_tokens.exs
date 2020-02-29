defmodule MusicUpdates.Repo.Migrations.CreateTokens do
  use Ecto.Migration

  def up do
    create table(:tokens) do
      add :refresh_token, :string
      add :user_id, :integer
      
      timestamps
    end
  end
end
