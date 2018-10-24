defmodule TaskTrackerWeb.TaskTimeView do
  use TaskTrackerWeb, :view
  alias TaskTrackerWeb.TaskTimeView

  def render("index.json", %{times: times}) do
    %{data: render_many(times, TaskTimeView, "task_time.json")}
  end

  def render("show.json", %{task_time: task_time}) do
    %{data: render_one(task_time, TaskTimeView, "task_time.json")}
  end

  def render("task_time.json", %{task_time: task_time}) do
    %{id: task_time.id,
      start_time: task_time.start_time,
      end_time: task_time.end_time}
  end
end
