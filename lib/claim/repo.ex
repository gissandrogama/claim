defmodule Claim.Repo do
  use Ecto.Repo,
    otp_app: :claim,
    adapter: Ecto.Adapters.Postgres
end
