defmodule Risk.MatchController do
  use Risk.Web, :controller

  alias Risk.User
  alias Risk.ApplicationHelper
  alias Risk.MatchUser
  alias Risk.Match


  def new(conn, %{"user_id" => id}) do
    render(conn, "new.html",
          p1: ApplicationHelper.current_user(conn),
          p2: Repo.get(User, id))
  end

  def create(conn, %{"user_id" => id}) do
    p1_id = ApplicationHelper.current_user(conn).id
    {p2_id, _} = Integer.parse(id)

    match = Repo.insert!(%Match{title: "title #{p1_id} vs #{p2_id}"})

    Repo.insert!(%MatchUser{user_id: p1_id, match_id: match.id })
    Repo.insert!(%MatchUser{user_id: p2_id, match_id: match.id })

    conn
    |> put_flash(:info, "So far so good!")
    |> redirect(to: match_path(conn, :show, match))
  end

  def show(conn, %{"id" => id}) do
    match = Repo.get!(Match, id)
    |> Repo.preload(:users)
    conn
    |> render("show.html", match: match)
  end
end
