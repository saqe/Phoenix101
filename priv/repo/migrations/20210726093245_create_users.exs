defmodule Pheonix101.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :title, :string
      add :dob, :date
      add :join_date, :date

      timestamps()
    end
  end
end
