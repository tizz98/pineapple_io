defmodule PineappleIo.PageController do
  use PineappleIo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
