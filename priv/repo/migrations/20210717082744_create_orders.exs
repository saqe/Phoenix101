defmodule Pheonix101.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :product_name, :string
      add :price, :integer

      timestamps()
    end

  end
end
