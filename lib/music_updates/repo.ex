defmodule MusicUpdates.Repo do
  use Ecto.Repo,
    otp_app: :music_updates,
    adapter: Ecto.Adapters.Postgres
end
