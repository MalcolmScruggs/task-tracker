defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :assigned, :string
    field :desc, :string
    field :title, :string
    has_one :task_times, TaskTracker.TaskTimes.TaskTime

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :assigned])
    |> validate_required([:title, :desc, :assigned])
  end
end
