defmodule GphPanelWeb.Router do
  use GphPanelWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GphPanelWeb do
    pipe_through :api
  end
end
