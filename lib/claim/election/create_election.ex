defmodule Claim.CreateElection do
  @moduledoc """
  Creating an elevtion
  """

  import Ecto.Changeset
  import Claim.DatesOverlap

  alias Claim.{Election, Repo}

  def run(params) do
    %Election{}
    |> cast(params, [:name, :cover, :notice, :starts_at, :ends_at, :created_by_id])
    |> validate_required([:name, :starts_at, :ends_at, :created_by_id])
    |> validate_dates_overlap(:starts_at, :ends_at)
    |> foreign_key_constraint(:created_by_id)
    |> Repo.insert()
  end
end
