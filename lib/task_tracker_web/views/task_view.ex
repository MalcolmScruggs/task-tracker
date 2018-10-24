defmodule TaskTrackerWeb.TaskView do
  use TaskTrackerWeb, :view
  require Logger

  def compute_time(task) do
    times = Map.get(task, :task_times)
    if times do
      start_time = Map.get(times, :start_time)
      end_time = Map.get(times, :end_time)
      if start_time && end_time do
        Float.round(NaiveDateTime.diff(end_time, start_time, :second) / 60, 2)
      end
    end
  end
end
