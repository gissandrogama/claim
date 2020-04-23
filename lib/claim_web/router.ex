defmodule ClaimWeb.Router do
  use ClaimWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", ClaimWeb do
    pipe_through :api

    post("/admin/sign_in", Admin.SessionController, :create)
  end
end
