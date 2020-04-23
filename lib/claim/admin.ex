defmodule Claim.Admin do
  @moduledoc """
  this is module that have  schema of the admin
  """

  use Ecto.Schema

  schema "administrators" do
    field :email, :string, null: false
    field :name, :string, null: false
    field :password, :string, virtual: true
    field :password_hash, :string, null: false

    timestamps()
  end

end
