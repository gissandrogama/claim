defmodule Claim.ListElections do
  @moduledoc """
  Listing election
  """

  import Ecto.Query, only: [from: 2]
  alias Claim.{Election, Repo}

  def run do
    query = from(e in Election, order_by: e.name)
    Repo.all(query)
  end
end
