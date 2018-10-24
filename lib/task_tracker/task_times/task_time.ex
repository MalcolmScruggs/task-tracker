defmodule TaskTracker.TaskTimes.TaskTime do
  use Ecto.Schema
  import Ecto.Changeset


  schema "times" do
    field :end_time, :naive_datetime
    field :start_time, :naive_datetime
    belongs_to :task, TaskTracker.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(task_time, attrs) do
    task_time
    |> cast(attrs, [:start_time, :end_time, :task_id])
    |> validate_required([:start_time, :task_id])
    |> unique_constraint(:task_id, name: :times_task_id_index)
  end
end
