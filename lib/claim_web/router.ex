defmodule ClaimWeb.Router do
  use ClaimWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_as_admin do
    plug :accepts, ["json"]
    plug ClaimWeb.AuthAccessPipeline
  end

  scope "/api/v1", ClaimWeb do
    pipe_through :api

    post("/admin/sign_in", Admin.SessionController, :create)
  end

  scope "/api/v1", ClaimWeb do
    pipe_through :api_as_admin

    post("/elections", ElectionController, :create)
  end
end
