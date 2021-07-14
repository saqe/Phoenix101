defmodule Pheonix101Web.PageController do
  use Pheonix101Web, :controller

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end

  @spec about(Plug.Conn.t(), any) :: Plug.Conn.t()
  def about(conn, _params) do
    render(conn, "about.html")
  end

  @spec redirect_wiki(Plug.Conn.t(), any) :: Plug.Conn.t()
  def redirect_wiki(conn, _params) do
    redirect(conn, external: "https://wikipedia.com")
  end
end
