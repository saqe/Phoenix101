defmodule Pheonix101Web.ProductApiView do
  use Pheonix101Web, :view
  alias Pheonix101Web.ProductApiView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductApiView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductApiView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{id: product.id, title: product.title, price: product.price}
  end

  def render("delete.json", _) do
    %{status: 200, message: "The product has been successfuly deleted"}
  end
end
