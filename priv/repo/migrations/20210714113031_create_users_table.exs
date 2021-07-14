defmodule Pheonix101.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:user) do
      add(:name, :string, size: 50)
      add(:email,:string)
      add(:age,  :integer)

      timestamps()
    end
  end
end
