defmodule Pheonix101.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pheonix101.Accounts.User

  schema "products" do
    field :price, :float
    field :title, :string

    belongs_to :user, User
  end

  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :price])
    |> validate_required([:title, :price])
  end
end
