defmodule TaskTracker.Repo.Migrations.AddManagers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :manager, references(:users, type: :string, column: :email, on_update: :update_all)
    end

    create index(:users, [:manager]);
  end
end
