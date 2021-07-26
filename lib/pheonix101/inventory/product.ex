defmodule Pheonix101.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pheonix101.Accounts.User

  schema "products" do
    field :price, :float
    field :title, :string

    belongs_to :managed_by, User, define_field: false

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :price])
    |> validate_required([:title, :price])
  end
end
