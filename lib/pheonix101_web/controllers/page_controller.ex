defmodule Pheonix101Web.PageController do
  use Pheonix101Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end

  def redirect_wiki(conn, _params) do
    redirect(conn, external: "https://wikipedia.com")
  end
end
