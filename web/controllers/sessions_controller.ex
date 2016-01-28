defmodule Risk.SessionsController do
  use Risk.Web, :controller

  alias Risk.Sessions

  plug :scrub_params, "sessions" when action in [:create, :update]

  def new(conn, params) do
    render(conn, "new.html")
  end

  def create(conn, %{"sessions" => %{"email" => email}}) do
    user = Repo.get_by(Risk.User, email: email)
    conn
    |> put_session(:user_id, user.id)
    |> put_flash(:info, "Logged in #{user.name} successfully.")
    |> redirect(to: user_path(conn, :show, user))
  end

  def destroy(conn, _params) do
    conn
    |> clear_session
    |> redirect(to: user_path(conn, :index))
  end

end
