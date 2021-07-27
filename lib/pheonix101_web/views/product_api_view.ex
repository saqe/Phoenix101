defmodule Pheonix101Web.ProductAPIView do
  use Pheonix101Web, :view
  alias Pheonix101Web.ProductAPIView

  def render("index.json", %{products: products}) do
    IO.inspect("[index.json] got request")
    %{data: render_many(products, ProductAPIView, "product.json", as: :product)}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductAPIView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      title: product.title,
      price: product.price,
      managed_by: product.user
    }
  end

  # Just to catch and forward request for product path
  def render("product.json", %{product_api: product}),
    do: render("product.json", %{product: product})

  def render("delete.json", _) do
    %{
      status: 204,
      message: "The product has been successfuly deleted"
    }
  end
end
