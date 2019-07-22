defmodule GphPanelWeb.Schema do
  use Absinthe.Schema

  query do
    field :id
    field :tags
  end
end
