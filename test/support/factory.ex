defmodule Claim.Factory do
  @moduledoc """
  Function to add admin for test
  """
  # with Ecto
  use ExMachina.Ecto, repo: Claim.Repo

  def admin_factory do
    %Claim.Admin{
      name: "Henry Gama",
      email: "henrygama@gmail.com",
      password_hash: Bcrypt.hash_pwd_salt("123123")
    }
  end

  def election_factory do
    %Claim.Election{
      name: "Election 2020/06",
      cover: "http-to-an-image",
      notice: "http-to-an-pdf",
      starts_at: ~U[2020-05-30 08:00:00Z],
      ends_at: ~U[2020-06-30 20:59:59Z],
      created_by: build(:admin)
    }
  end

  def election_factory do
    %Claim.Election{
      name: "Election 2020",
      cover: "http-to-an-image",
      notice: "http-to-an-pdf",
      starts_at: ~U[2020-04-24 08:00:00Z],
      ends_at: ~U[2020-04-30 20:59:59Z],
      created_by: build(:admin)
    }
  end
end
