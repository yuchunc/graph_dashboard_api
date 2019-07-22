defmodule GphPanelWeb.Router do
  use GphPanelWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GphPanelWeb do
    pipe_through :api
  end

  if Mix.env == :dev do
    forward "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: GphPanelWeb.Schema,
      interface: :simple
  end
end
