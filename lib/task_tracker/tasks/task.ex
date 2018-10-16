defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :assigned, :string
    field :completed, :boolean, default: false
    field :desc, :string
    field :time, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :completed, :time, :assigned])
    |> validate_required([:title, :desc, :completed])
  end
end
