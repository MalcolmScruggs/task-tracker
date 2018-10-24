defmodule TaskTrackerWeb.TaskTimeController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.TaskTimes
  alias TaskTracker.TaskTimes.TaskTime

  action_fallback TaskTrackerWeb.FallbackController

  def index(conn, _params) do
    times = TaskTimes.list_times()
    render(conn, "index.json", times: times)
  end

  def create(conn, %{"task_time" => task_time_params}) do
    with {:ok, %TaskTime{} = task_time} <- TaskTimes.create_task_time(task_time_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.task_time_path(conn, :show, task_time))
      |> render("show.json", task_time: task_time)
    end
  end

  def show(conn, %{"id" => id}) do
    task_time = TaskTimes.get_task_time!(id)
    render(conn, "show.json", task_time: task_time)
  end

  def update(conn, %{"id" => id, "task_time" => task_time_params}) do
    task_time = TaskTimes.get_task_time!(id)

    with {:ok, %TaskTime{} = task_time} <- TaskTimes.update_task_time(task_time, task_time_params) do
      render(conn, "show.json", task_time: task_time)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_time = TaskTimes.get_task_time!(id)

    with {:ok, %TaskTime{}} <- TaskTimes.delete_task_time(task_time) do
      send_resp(conn, :no_content, "")
    end
  end
end
