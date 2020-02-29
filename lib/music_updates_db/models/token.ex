defmodule MusicUpdates.Token do
  @moduledoc false
  use Ecto.Schema

  # weather is the DB table
  schema "token" do
    field :refresh,    :string

    timestamps
  end

end
