defmodule ClaimWeb.Admin.SessionViewTest do
  use ExUnit.Case, async: true

  alias ClaimWeb.Admin.SessionView

  import Claim.Factory

  test "render/2 returns ok and the admin data" do
    admin = params_for(:admin, name: "Cupu Smith")

    assert %{status: "ok", data: %{name: "Cupu Smith", token: "token"}} =
             SessionView.render("session.json", %{admin: admin, token: "token"})
  end
end
