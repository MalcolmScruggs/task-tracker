defmodule TaskTracker.Repo.Migrations.CreateTimes do
  use Ecto.Migration

  def change do
    create table(:times) do
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :task_id, references(:tasks, on_delete: :nothing)

      timestamps()
    end

    create index(:times, [:task_id], unique: true)
  end
end
