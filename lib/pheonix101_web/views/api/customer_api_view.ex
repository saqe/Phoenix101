defmodule Pheonix101Web.CustomerApiView do
  use Pheonix101Web, :view
  alias Pheonix101Web.CustomerApiView

  def render("index.json", %{customers: customers}),
    do: %{data: render_many(customers, CustomerApiView, "customer.json")}

  def render("show.json", %{customer: customer}),
    do: %{data: render_one(customer, CustomerApiView, "customer.json")}

  def render("customer.json", %{customer_api: customer}),
    do: render("customer.json", %{customer: customer})

  def render("customer.json", %{customer: customer}) do
    %{
      id: customer.id,
      first_name: customer.first_name,
      last_name: customer.last_name,
      email: customer.email,
      phone_number: customer.phone_number,
      address: customer.address,
      dob: customer.dob
    }
  end
end
