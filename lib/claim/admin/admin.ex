defmodule Claim.Admin do
  @moduledoc """
  this is module that have  schema of the admin
  """

  use Ecto.Schema

  schema "administrators" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end
end
