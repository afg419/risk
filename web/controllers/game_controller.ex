defmodule Risk.GameController do
  use Risk.Web, :controller

  alias Risk.User
  # alias Risk.Game

  def new(conn, %{"user_id" => id}) do
    render(conn, "new.html",
          p1: Risk.ApplicationHelper.current_user(conn),
          p2: Repo.get(User, id))
  end

  def create(conn, %{"user_id" => id}) do
    p1 = Risk.ApplicationHelper.current_user(conn)
    p2 = Repo.get(User, id)

    # changeset = Game.changeset(%Game{},
    #   %{player_1: p1, player_2: p2}
    # )

    conn
    |> put_flash(:info, "So far so good!")
    |> redirect(to: user_path(conn, :index))
  end

end
