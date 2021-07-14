defmodule Pheonix101Web.ApiController do
  use Pheonix101Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
