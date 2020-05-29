defmodule ClaimWeb.Admin.ElectionControllerTest do
  use ClaimWeb.ConnCase, async: true

  import ClaimWeb.AdminAuth
  import Claim.Factory

  setup %{conn: conn} do
    conn = authenticate(conn)
    %{conn: conn}
  end

  describe "create/2" do
    test "returns 201 when election is created sucessfully", %{conn: conn} do
      params = %{
        "name" => "Eleição 2020/06",
        "cover" => "any-url",
        "notice" => "any-notice",
        "starts_at" => "2020-05-30T14:42:00Z",
        "ends_at" => "2020-06-30T20:00:00Z"
      }

      conn = post(conn, "/api/v1/elections", params)
      assert %{"status" => "ok", "data" => _} = json_response(conn, 201)
    end

    test "returns 422 when params is invalid", %{conn: conn} do
      params = %{
        "name" => " ",
        "cover" => "any-url",
        "notice" => "any-notice",
        "starts_at" => "2020-05-30T14:42:00Z",
        "ends_at" => "2020-06-30T20:00:00Z"
      }

      conn = post(conn, "/api/v1/elections", params)
      assert %{"status" => "unprocessable entity"} = json_response(conn, 422)
    end
  end

  describe "update/2" do
    test "returns 200 when election is updated successfully", %{conn: conn} do
      election = insert(:election)
      params = %{"name" => "Election 2020"}

      conn = put(conn, "/api/v1/elections/#{election.id}", params)

      assert %{"status" => "ok", "data" => %{"name" => "Election 2020"}} =
               json_response(conn, 200)
    end

    test "returns 422 when params are invalid", %{conn: conn} do
      election = insert(:election)
      params = %{"name" => ""}

      conn = put(conn, "/api/v1/elections/#{election.id}", params)
      assert %{"status" => "unprocessable entity"} = json_response(conn, 422)
    end
  end
end
