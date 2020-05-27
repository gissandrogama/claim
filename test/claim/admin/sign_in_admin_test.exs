defmodule Claim.SignInAdminTest do
  use Claim.DataCase, async: true

  import Claim.Factory

  alias Claim.{Admin, SignInAdmin}

  describe "run/2" do
    setup do
      insert(:admin)
      :ok
    end

    test "returns ok when email and password match" do
      assert {:ok, %Admin{}} = SignInAdmin.run("kiba@gmail.com", "123456")
    end

    test "returns error when there is no admin with this email" do
      assert {:error, :email_or_password_invalid} = SignInAdmin.run("fom@gmail.com", "123456")
    end

    test "returns error when the password is invalid" do
      assert {:error, :email_or_password_invalid} = SignInAdmin.run("kiba@gmail.com", "12345678")
    end
  end
end
