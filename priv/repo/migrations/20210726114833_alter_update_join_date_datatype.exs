defmodule Pheonix101.Repo.Migrations.AlterUpdateJoinDateDatatype do
  use Ecto.Migration

  def change do
    alter table("products") do
      add :user_id, references(:users)
    end
  end
end
