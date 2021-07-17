defmodule Pheonix101Web.OrderView do
  use Pheonix101Web, :view
  alias Pheonix101Web.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id,
      product_name: order.product_name,
      price: order.price}
  end
end
