defmodule TaskTrackerWeb.Plugs.RequireManager do
  require Logger
  use TaskTrackerWeb, :controller

  def init(args), do: args

  def call(conn, _params) do
    Logger.debug "HERE IN THE CALL"

    user = conn.assigns[:current_user]
    task = conn.body_params["task"]
    assigned = task["assigned"]
    isValidManager = Enum.find(user.managed, fn m -> m.email == assigned end)

    if isValidManager || (!user.manager && assigned == user.email) do
      conn
    else
      conn
      |> put_flash(:error, "You can't do that.")
      |> redirect(to: Routes.task_path(conn, :index))
      |> halt
    end
  end

end
