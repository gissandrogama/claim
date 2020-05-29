defmodule Claim.ElectionRepo do
  @moduledoc """
  Election Repository
  """

  alias Claim.{Election, Repo}

  def get_election!(id), do: Repo.get!(Election, id)
end
