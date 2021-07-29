defmodule Pheonix101.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pheonix101.Orders.Customer

  schema "orders" do
    belongs_to :customer, Customer
    field :amount, :float

    field :status, Ecto.Enum,
      values: [:PAYMENT_PENDING, :IN_PROGRESS, :IN_TRANSIT, :DELIVERED, :REVIEWED]

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer_id, :amount, :status])
    |> validate_required([:customer_id, :amount, :status])
  end
end
