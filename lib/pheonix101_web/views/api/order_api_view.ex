defmodule Pheonix101Web.OrderApiView do
  use Pheonix101Web, :view
  alias Pheonix101Web.OrderApiView

  def render("index.json", %{orders: orders}),
    do: %{data: render_many(orders, OrderApiView, "order.json", as: :order)}

  def render("show.json", %{order: order}),
    do: %{data: render_one(order, OrderApiView, "order.json", as: :order)}

  def render("customer_orders.json", %{order: order}) do
    %{
      order_id: order.id,
      amount: order.amount,
      order_status: order.status,
      order_date: order.inserted_at
    }
  end

  def render("order.json", %{order: order}) do
    %{
      id: order.id,
      customer_id: order.customer_id,
      amount: order.amount,
      order_status: order.status,
      order_date: order.inserted_at
    }
  end
end
