defmodule Pheonix101.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :customer_id, references(:customers)
      add :amount, :float
      add :status, :string

      timestamps()
    end

    create index(:orders, [:customer_id])
  end
end
