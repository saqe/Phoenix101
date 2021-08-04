defmodule Pheonix101Web.Resolvers.Product do
  alias Pheonix101.Inventory

  def list_products(_parent, _args, _resolution) do
    {:ok, Inventory.list_products()}
  end
end
