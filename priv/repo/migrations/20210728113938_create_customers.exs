defmodule Pheonix101.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :phone_number, :string
      add :address, :string
      add :dob, :date

      timestamps()
    end

  end
end
