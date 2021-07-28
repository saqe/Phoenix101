defmodule Pheonix101Web.CustomerApiController do
  use Pheonix101Web, :controller

  alias Pheonix101.Orders
  alias Pheonix101.Orders.Customer

  action_fallback Pheonix101Web.FallbackController

  def index(conn, _params) do
    customers = Orders.list_customers()
    render(conn, "index.json", customers: customers, view: CustomerView)
  end

  def create(conn, %{"customer" => customer_params}) do
    with {:ok, %Customer{} = customer} <- Orders.create_customer(customer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.customer_path(conn, :show, customer))
      |> render("show.json", customer: customer, view: CustomerView)
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Orders.get_customer!(id)
    render(conn, "show.json", customer: customer)
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    customer = Orders.get_customer!(id)

    with {:ok, %Customer{} = customer} <- Orders.update_customer(customer, customer_params) do
      render(conn, "show.json", customer: customer)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Orders.get_customer!(id)

    with {:ok, %Customer{}} <- Orders.delete_customer(customer) do
      send_resp(conn, :no_content, "")
    end
  end
end
