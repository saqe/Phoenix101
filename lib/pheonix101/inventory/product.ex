defmodule Pheonix101.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :price, :float
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :price])
    |> validate_required([:title, :price])
  end
end
