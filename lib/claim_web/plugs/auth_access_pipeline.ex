defmodule ClaimWeb.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :claim

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
