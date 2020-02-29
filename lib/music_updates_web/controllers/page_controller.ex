defmodule MusicUpdatesWeb.PageController do
  use MusicUpdatesWeb, :controller

  def index(conn, %{"code" => code}) do
    token_url = "https://accounts.spotify.com/api/token"
    headers = %{
      "Content-Type" => "application/x-www-form-urlencoded", 
      "Authorization" => "Basic " <> Base.encode64(System.get_env("SPOTIFY_CLIENT_ID") <> 
                                                   ":" <> 
                                                   System.get_env("SPOTIFY_SECRET_KEY"))
    }
    body = URI.encode_query(%{grant_type: "authorization_code", code: code, redirect_uri: "http://localhost:4000"})
    {:ok, %{"refresh_token" => refresh_token, "access_token" => access_token}} = HTTPoison.post(token_url, body, headers)
      |> case do
           {:ok, resp} -> resp |> Map.get(:body) |> Jason.decode
           _ -> IO.puts("Error")
         end
     
    render(conn, "index.html")
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end
  
  def login(conn, params) do
    base_url = "https://accounts.spotify.com/authorize"
    params = %{
      "client_id" => System.get_env("SPOTIFY_CLIENT_ID"),
      "response_type" => "code",
      "redirect_uri" => Application.get_env(:music_updates, :redirect_uri),
      "scope" => "user-library-read"
    }
    url = base_url <> "?" <> URI.encode_query(params)

    redirect conn, external: url
  end
end
