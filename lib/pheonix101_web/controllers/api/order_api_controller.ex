defmodule Pheonix101Web.OrderApiController do
  use Pheonix101Web, :controller

  alias Pheonix101.Orders
  alias Pheonix101.Orders.Order
  alias Pheonix101.Orders.Invoice

  action_fallback(Pheonix101Web.FallbackController)

  def index(conn, _params) do
    orders = Orders.list_orders()
    render(conn, "index.json", orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    with {:ok, %Order{} = order} <- Orders.create_order(order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end

  def send_order(conn, %{"customer_id" => customer_id, "cart" => cart}) do
    order_params = %{
      customer_id: customer_id,
      status: Order.default_status()
    }

    with {:ok, %Order{} = order} <- Orders.create_order(order_params) do
      IO.inspect("=====[order]======")
      IO.inspect(order)
      IO.inspect("=====[order]======")

      cart = Enum.map(cart, &Map.put(&1, "order_id", order.id))

      with {:ok, _message} <- Orders.create_invoices(cart) do
        IO.inspect(_message)

        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.order_path(conn, :show, order))
        |> render("show.json", order: order)
      end
    end
  end

  def show(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    render(conn, "show.json", order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Orders.get_order!(id)

    with {:ok, %Order{} = order} <- Orders.update_order(order, order_params) do
      render(conn, "show.json", order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Orders.get_order!(id)

    with {:ok, %Order{}} <- Orders.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end
end
