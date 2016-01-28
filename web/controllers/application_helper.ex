defmodule Risk.ApplicationHelper do
  use Risk.Web, :controller
  alias Risk.ApplicationHelper

  def current_user(conn) do
    if id = get_session(conn, :user_id) do
      Repo.get!(Risk.User, id)
    end
  end
end
