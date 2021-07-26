defmodule Pheonix101.Repo.Migrations.AlterUpdateJoinDateDatatype do
  use Ecto.Migration

  def change do
    alter table("products") do
      add :managed_by, references(:users)
    end
  end
end
