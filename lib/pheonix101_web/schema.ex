defmodule Pheonix101.Schema do
  use Absinthe.Schema
  alias Pheonix101Web.Schemas

  alias Pheonix101Web.Resolvers

  query do
    @desc "List of products"
    field :products, list_of(:product) do
      resolve(&Resolvers.Product.list_products/3)
    end
  end

  # import_types(Absinthe.Plug.Types)
  import_types(Schemas.Types)
  # import_types(Schemas.User)
  # import_types(Schemas.Room)
  # import_types(Schemas.Buddy)
  # import_types(Schemas.Session)

  # def middleware(middleware, _field, %{identifier: identifier})
  #     when identifier in ~w[query subscription mutation]a do
  #   [EvernowWeb.Middlewares.LoadUser] ++ middleware
  # end

  # def middleware(middleware, _field, _object), do: middleware

  # query do
  #   import_fields(:user_queries)
  #   import_fields(:room_queries)
  # end

  # mutation do
  #   import_fields(:user_mutations)
  #   import_fields(:room_mutations)
  #   import_fields(:buddy_mutations)
  #   import_fields(:session_mutations)
  # end
end
