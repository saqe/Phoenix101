defmodule Pheonix101.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :quantity, :integer
      add :order_id, references(:orders, on_delete: :delete_all)
      add :product_id, references(:products, on_delete: :nothing)
    end

    create index(:invoices, [:order_id])
    create index(:invoices, [:product_id])
  end
end
