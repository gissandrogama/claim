defmodule ClaimWeb.Admin.UploadControllerTest do
  use ClaimWeb.ConnCase, async: true
  use Mimic

  import ClaimWeb.AdminAuth

  setup %{conn: conn} do
    conn = authenticate(conn)
    %{conn: conn}
  end

  describe "create/2" do
    test "returns 200 when upload is sucessfully", %{conn: conn} do
      expect(ExAws, :request, fn _ -> {:ok, %{status_code: 200}} end)
      params = %{
        "file" => %Plug.Upload{content_type: "image/jpeg", filename: "tela5.jpg", path: "/tmp/plug-1590/multipart-1590723028-963576422837681-3"}
      }

      conn = post(conn, "/api/v1/uploads", params)
      assert %{"status" => "ok", "data" => %{"url" => _}} = json_response(conn, 200)
    end

    test "returns 400 when upload is failed", %{conn: conn} do
      expect(ExAws, :request, fn _ -> {:error, %{status_code: 500}} end)
      params = %{
        "file" => %Plug.Upload{content_type: "image/jpeg", filename: "tela5.jpg", path: "/tmp/plug-1590/multipart-1590723028-963576422837681-3"}
      }

      conn = post(conn, "/api/v1/uploads", params)
      assert %{"status" => "upload_error"} = json_response(conn, 400)
    end

    test "returns 400 when file is too large", %{conn: conn} do
      reject(&ExAws.request/1)
      params = %{
        "file" => %Plug.Upload{content_type: "image/jpeg", filename: "tela5.jpg", path: "/users/local/images/large_logo.jpg"}
      }

      conn = post(conn, "/api/v1/uploads", params)
      assert %{"status" => "file_too_large"} = json_response(conn, 400)
    end

  end
end
