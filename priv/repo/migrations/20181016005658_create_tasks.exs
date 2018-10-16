defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :desc, :text
      add :completed, :boolean, default: false, null: false
      add :time, :integer
      add :assigned, references(:users, type: :string, column: :email, on_update: :update_all)

      timestamps()
    end

    create constraint(:tasks, :time_must_be_positive, check: "time >= 0")
  end


end
