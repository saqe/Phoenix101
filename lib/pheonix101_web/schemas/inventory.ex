defmodule Pheonix101Web.Schemas.Inventory do
  use Absinthe.Schema.Notation

  object :product do
    field :id, non_null(:id)
    field :price, :float
    field :title, :string
  end
end
