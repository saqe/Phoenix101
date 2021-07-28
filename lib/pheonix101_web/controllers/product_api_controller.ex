defmodule Pheonix101Web.ProductAPIController do
  use Pheonix101Web, :controller

  alias Pheonix101.Inventory
  alias Pheonix101.Inventory.Product

  action_fallback Pheonix101Web.FallbackController

  @spec index(Plug.Conn.t(), map) :: Plug.Conn.t()
  def index(conn, _params) do
    products = Inventory.list_products()

    conn
    |> render("index.json", products: products)
  end

  @spec create(any, map) :: Plug.Conn.t()
  def create(conn, %{} = product_params) do
    with {:ok, %Product{} = product} <- Inventory.create_product(product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.product_path(conn, :show, product))
      |> render("show.json", product: product)
    end
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    product = Inventory.get_product!(id)
    render(conn, "show.json", product: product)
  end

  def show_updated_today(conn, params) do
    IO.inspect(params)
    products = Inventory.updated_today()
    render(conn, "index.json", products: products)
  end

  # Query all of the products that are updated today
  @spec query(Plug.Conn.t(), map) :: Plug.Conn.t()
  def query(conn, %{"updated" => "today"}) do
    products = Inventory.updated_today()
    render(conn, "index.json", products: products)
  end

  # Query product by title
  def query(conn, %{"title" => title}) do
    products = Inventory.get_product_by_title(title)
    render(conn, "index.json", products: products)
  end

  # A generic query for pattern matching
  def query(conn, %{} = params) do
    json(
      conn,
      %{
        status: 200,
        message: "Query is working fine, but no query pattern were matched",
        params: params
      }
    )
  end

  @spec update(any, map) :: Plug.Conn.t()
  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Inventory.get_product!(id)

    with {:ok, %Product{} = product} <- Inventory.update_product(product, product_params) do
      render(conn, "show.json", product: product)
    end
  end

  @spec delete(any, map) :: Plug.Conn.t()
  def delete(conn, %{"id" => id}) do
    product = Inventory.get_product!(id)

    with {:ok, %Product{}} <- Inventory.delete_product(product) do
      conn
      |> put_status(:delete)
      |> render("delete.json", :deleted)
    end
  end
end
