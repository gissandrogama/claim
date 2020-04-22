defmodule ClaimWeb.Router do
  use ClaimWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ClaimWeb do
    pipe_through :api
  end
end
