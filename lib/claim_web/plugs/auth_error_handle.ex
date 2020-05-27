defmodule ClaimWeb.AuthErrorHandler do
  @moduledoc """
  Modulo para retornar erro do plug de autenticação
  """
  import Plug.Conn

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _reason}, _opts) do
    body = Phoenix.json_library().encode!(%{message: to_string(type)})

    conn
    |> put_resp_content_type("application/jason")
    |> send_resp(401, body)
  end
end
