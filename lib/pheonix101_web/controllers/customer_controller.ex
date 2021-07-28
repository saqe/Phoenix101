defmodule Pheonix101Web.CustomerController do
  use Pheonix101Web, :controller

  alias Pheonix101.Orders
  alias Pheonix101.Orders.Customer

  def index(conn, _params) do
    customers = Orders.list_customers()
    render(conn, "index.html", customers: customers)
  end

  def new(conn, _params) do
    changeset = Orders.change_customer(%Customer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"customer" => customer_params}) do
    case Orders.create_customer(customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer created successfully.")
        |> redirect(to: Routes.customer_path(conn, :show, customer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Orders.get_customer!(id)
    render(conn, "show.html", customer: customer)
  end

  def edit(conn, %{"id" => id}) do
    customer = Orders.get_customer!(id)
    changeset = Orders.change_customer(customer)
    render(conn, "edit.html", customer: customer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    customer = Orders.get_customer!(id)

    case Orders.update_customer(customer, customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer updated successfully.")
        |> redirect(to: Routes.customer_path(conn, :show, customer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", customer: customer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Orders.get_customer!(id)
    {:ok, _customer} = Orders.delete_customer(customer)

    conn
    |> put_flash(:info, "Customer deleted successfully.")
    |> redirect(to: Routes.customer_path(conn, :index))
  end
end
