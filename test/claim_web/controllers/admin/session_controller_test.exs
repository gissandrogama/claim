defmodule ClaimWeb.Admin.SessionControllerTest do
  use ClaimWeb.ConnCase, async: true

  import Claim.Factory

  describe "create/2" do
    setup %{conn: conn} do
      insert(:admin, name: "Kiba Smith", email: "kiba@gmail.com")

      %{conn: conn}
    end

    test "returns 200 when admin credentials are valid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/admin/sign_in", %{"email" => "kiba@gmail.com", "password" => "123456"})

      assert %{"status" => "ok", "data" => %{"name" => "Kiba Smith", "token" => _}} = json_response(conn, 200)
    end

    test "returns 401 when admin email is invalid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/admin/sign_in", %{"email" => "fom@gmail.com", "password" => "123456"})

      assert %{"status" => "unauthenticated"} = json_response(conn, 401)
    end

    test "returns 401 when admin password is invalid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/admin/sign_in", %{
          "email" => "kiba@gmail.com",
          "password" => "1234567"
        })

      assert %{"status" => "unauthenticated"} = json_response(conn, 401)
    end
  end
end
