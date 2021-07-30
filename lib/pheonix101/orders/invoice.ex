defmodule Pheonix101.Orders.Invoice do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pheonix101.Orders.Order
  alias Pheonix101.Inventory.Product

  schema "invoices" do
    field :quantity, :integer
    belongs_to :order, Order
    belongs_to :product, Product
  end

  @doc false
  def changeset(invoice, attrs) do
    invoice
    |> cast(attrs, [:order_id, :product_id, :quantity])
    |> validate_required([:order_id, :product_id, :quantity])
  end
end
