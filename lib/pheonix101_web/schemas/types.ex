defmodule Pheonix101Web.Schemas.Types do
  use Absinthe.Schema.Notation

  object :product do
    field :id, non_null(:id)
    field :price, :float
  end
end
