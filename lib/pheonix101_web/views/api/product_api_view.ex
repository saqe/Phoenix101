defmodule Pheonix101Web.ProductAPIView do
  use Pheonix101Web, :view
  alias Pheonix101Web.ProductAPIView
  alias Pheonix101Web.UserAPIView

  def render("index.json", %{products: products}),
    do: %{data: render_many(products, ProductAPIView, "product.json", as: :product)}

  def render("show.json", %{product: product}),
    do: %{data: render_one(product, ProductAPIView, "product.json", as: :product)}

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      title: product.title,
      price: product.price,
      managed_by: render_one(product.user, UserAPIView, "user_manager.json", as: :user)
    }
  end

  def render("delete.json", _),
    do: %{status: 204, message: "The product has been successfuly deleted"}
end
