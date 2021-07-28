defmodule Pheonix101Web.ProductAPIView do
  use Pheonix101Web, :view
  alias Pheonix101Web.ProductAPIView
  alias Pheonix101Web.UserAPIView
  alias Pheonix101.Accounts.User

  def render("index.json", %{products: products}),
    do: %{data: render_many(products, ProductAPIView, "product.json", as: :product)}

  def render("show.json", %{product: product}),
    do: %{data: render_one(product, ProductAPIView, "product.json")}

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      title: product.title,
      price: product.price,
      managed_by: render_one(product.user, UserAPIView, "user_manager.json")
    }
  end

  def render("product.json", %{product_api: product}),
    do: render("product.json", %{product: product})

  def render("delete.json", _),
    do: %{status: 204, message: "The product has been successfuly deleted"}
end
