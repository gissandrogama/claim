defmodule ClaimWeb.Admin.SessionView do
  use ClaimWeb, :view

  def render("session.json", %{admin: admin}) do
    %{
      status: "ok",
      data: %{
        name: admin.name
      }
    }
  end
end
