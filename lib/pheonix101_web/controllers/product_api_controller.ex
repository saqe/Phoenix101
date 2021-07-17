defmodule Pheonix101Web.ProductApiController do
  use Pheonix101Web, :controller
  alias Pheonix101.Inventory
  alias Pheonix101.Inventory.Product

  action_fallback Pheonix101Web.FallbackController

  def index(conn, _params) do
    products = Inventory.list_products() |> IO.inspect()

    conn
    |> render("index.json", products: products)
  end

  @spec create(any, map) :: any
  def create(conn, %{"product" => product_params}) do
    with {:ok, %Product{} = product} <- Inventory.create_product(product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.product_path(conn, :show, product))
      |> render("show.json", product: product)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Inventory.get_product!(id)
    render(conn, "show.json", product: product)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Inventory.get_product!(id)

    with {:ok, %Product{} = product} <- Inventory.update_product(product, product_params) do
      render(conn, "show.json", product: product)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Inventory.get_product!(id)

    with {:ok, %Product{}} <- Inventory.delete_product(product) do
      conn
      |> put_status(:delete)
      |> render("delete.json")

      # |> send_resp(:no_content, "")
    end
  end
end
