defmodule Claim.Factory do
  @moduledoc """
  Function to add admin for test
  """
  # with Ecto
  use ExMachina.Ecto, repo: Claim.Repo

  def admin_factory do
    %Claim.Admin{
      name: "Kiba Smith",
      email: "kiba@gmail.com",
      password_hash: Bcrypt.hash_pwd_salt("123456")
    }
  end
end
