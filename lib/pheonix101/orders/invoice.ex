defmodule Pheonix101.Orders.Invoice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoices" do
    field :quantity, :integer
    field :order_id, :id
    field :product_id, :id
  end

  @doc false
  def changeset(invoice, attrs) do
    invoice
    |> cast(attrs, [:order_id, :product_id, :quantity])
    |> validate_required([:order_id, :product_id, :quantity])
  end
end
