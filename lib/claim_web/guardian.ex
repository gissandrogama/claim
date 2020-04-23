defmodule ClaimWeb.Guardian do
  @moduledoc """
  This use JWT for authetication
  """
  use Guardian, otp_app: :claim

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Claim.AdminRepo.get_admin!(id)
    {:ok, resource}
  end
end
