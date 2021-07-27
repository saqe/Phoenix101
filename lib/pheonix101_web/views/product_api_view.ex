defmodule Pheonix101Web.ProductAPIView do
  use Pheonix101Web, :view
  alias Pheonix101Web.ProductAPIView

  def render("index.json", %{products: products}),
    do: %{data: render_many(products, ProductAPIView, "product.json", as: :product)}

  def render("show.json", %{product: product}),
    do: %{data: render_one(product, ProductAPIView, "product.json")}

  @spec get_manager(atom | struct) :: nil | map
  def get_manager(user) when is_nil(user), do: nil
  def get_manager(user), do: Map.from_struct(user) |> Map.delete(:__meta__)

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      title: product.title,
      price: product.price,
      managed_by: get_manager(product.user)
    }
  end

  # Just to catch and forward request for product path
  def render("product.json", %{product_api: product}),
    do: render("product.json", %{product: product})

  def render("delete.json", _),
    do: %{status: 204, message: "The product has been successfuly deleted"}
end
