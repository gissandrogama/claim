defmodule Claim.CreateAdminTest do
  use Claim.DataCase, async: true

  alias Claim.{Admin, CreateAdmin}

  describe "run/1" do
    test "returns a struct when the params are valid" do
      params = %{name: "chico", email: "chico@gmail.com", password: "123123"}
      assert {:ok, %Admin{} = admin} = CreateAdmin.run(params)
      assert admin.name == "chico"
      assert admin.email == "chico@gmail.com"
      # or assert admin.password_hash != "123123"
      refute admin.password_hash == "123123"
    end

    test "returns error when name is missing" do
      params = %{name: "", email: "chico@gmail.com", password: "123123"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when email is missing" do
      params = %{name: "chico", email: "", password: "123123"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{email: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns errot when password is missing" do
      params = %{name: "chico", email: "chico@gmail.com", password: ""}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{password: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
