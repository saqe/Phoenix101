defmodule Pheonix101Web.CustomerApiView do
  use Pheonix101Web, :view
  alias Pheonix101Web.CustomerApiView
  alias Pheonix101Web.OrderApiView

  def render("index.json", %{customers: customers}),
    do: %{data: render_many(customers, CustomerApiView, "customer.json", as: :customer)}

  def render("show.json", %{customer: customer}),
    do: %{data: render_one(customer, CustomerApiView, "customer.json", as: :customer)}

  def render("show_orders.json", %{orders: customer_orders}) do
    %{
      customer_info:
        render_one(
          customer_orders.customer,
          CustomerApiView,
          "customer_basic_view.json",
          as: :customer
        ),
      orders:
        render_many(
          customer_orders.orders,
          OrderApiView,
          "customer_orders.json",
          as: :order
        )
    }
  end

  def render("customer_basic_view.json", %{customer: customer}) do
    %{
      name: customer.first_name <> " " <> customer.last_name,
      date_of_birth: customer.dob,
      address: customer.address
    }
  end

  def render("customer.json", %{customer: customer}) do
    %{
      id: customer.id,
      first_name: customer.first_name,
      last_name: customer.last_name,
      email: customer.email,
      phone_number: customer.phone_number,
      address: customer.address,
      date_of_birth: customer.dob
    }
  end
end
