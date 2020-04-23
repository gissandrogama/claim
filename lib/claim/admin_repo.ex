defmodule Claim.AdminRepo do
  @moduledoc """
  Admin repository
  """

  alias Claim.{Admin, Repo}

  def get_admin!(id) do
    Repo.get!(Admin, id)
  end
end
