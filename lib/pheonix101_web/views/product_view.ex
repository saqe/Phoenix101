defmodule Pheonix101Web.ProductView do
  use Pheonix101Web, :view
  alias Pheonix101Web.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{id: product.id,
      title: product.title,
      price: product.price}
  end
end
