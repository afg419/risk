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

  def create(conn, %{"user_id" => id, "match" => %{"title" => title}}) do
    p1_id = ApplicationHelper.current_user(conn).id
    {p2_id, _} = Integer.parse(id)

    match = Repo.insert!(%Match{title: "#{title}", current_player: p1_id})

    Repo.insert!(%MatchUser{user_id: p1_id, match_id: match.id })
    Repo.insert!(%MatchUser{user_id: p2_id, match_id: match.id })

    conn
    |> put_flash(:info, "So far so good!")
    |> redirect(to: match_path(conn, :show, match))
  end

  def show(conn, %{"id" => id}) do
    match = Repo.get!(Match, id)
    |> Repo.preload(:users)

    current_player = Repo.get(User, match.current_player)

    conn
    |> render("show.html", match: match, current_player: current_player)
  end

  def edit(conn, %{"id" => id}) do
    match = Repo.get!(Match, id) |> Repo.preload(:users)
    changeset = Match.changeset(match)
    current_player = Repo.get(User, match.current_player)

    conn
    |> render("edit.html", current_player: current_player, changeset: changeset, match: match)
  end

  def update(conn, %{"id" => id, "match" => match_params}) do
    match = Repo.get!(Match, id) |> Repo.preload(:users)

    match_params = Dict.put(match_params, "current_player", Match.next_player(match))

    changeset = Match.changeset(match, match_params)

    case Repo.update(changeset) do
      {:ok, match} ->
        conn
        |> put_flash(:info, "You've taken a turn!")
        |> redirect(to: match_path(conn, :show, match))
      {:error, changeset} ->
        conn
        |> redirect(to: match_path(conn, :edit, match))
    end
  end
end
