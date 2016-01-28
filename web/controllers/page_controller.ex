defmodule Risk.PageController do
  use Risk.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
