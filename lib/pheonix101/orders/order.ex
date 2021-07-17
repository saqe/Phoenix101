defmodule Pheonix101.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :price, :integer
    field :product_name, :string

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:product_name, :price])
    |> validate_required([:product_name, :price])
  end
end
