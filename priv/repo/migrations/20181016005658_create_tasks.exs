defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :desc, :text, null: false
      add :assigned, references(:users, type: :string, column: :email, on_update: :update_all), null: false

      timestamps()
    end

  end


end
