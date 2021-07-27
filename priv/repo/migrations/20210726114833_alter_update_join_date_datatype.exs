defmodule Pheonix101.Repo.Migrations.AlterUpdateJoinDateDatatype do
  use Ecto.Migration

  def change do
    alter table("products") do
      add :user, references(:users)
    end
  end
end
