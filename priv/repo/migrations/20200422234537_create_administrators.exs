defmodule Claim.Repo.Migrations.CreateAdministrators do
  use Ecto.Migration

  def change do
    create table(:administrators) do
      add :name, :string
      add :email, :string
      add :password_hash, :string

      timestamps()
    end
  end
end
