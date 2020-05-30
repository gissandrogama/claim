defmodule Claim.UpdateElection do
  @moduledoc """
  Upload an elevtion
  """

  import Ecto.Changeset
  import Claim.DatesOverlap

  alias Claim.{Election, Repo}

  def run(%Election{} = election, params) do
    election
    |> cast(params, [:name, :cover, :notice, :starts_at, :ends_at])
    |> validate_required([:name, :starts_at, :ends_at])
    |> validate_dates_overlap(:starts_at, :ends_at)
    |> Repo.update()
  end
end
