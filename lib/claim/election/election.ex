defmodule Claim.Election do
  @moduledoc """
  Schema da da tabela elecions 
  """
  use Ecto.Schema

  alias Claim.Admin

  schema "elections" do
    field :cover, :string
    field :ends_at, :utc_datetime
    field :name, :string
    field :notice, :string
    field :starts_at, :utc_datetime
    belongs_to :created_by, Admin

    timestamps()
  end
end
