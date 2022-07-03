defmodule PrimestateWeb.PageController do
  use PrimestateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
