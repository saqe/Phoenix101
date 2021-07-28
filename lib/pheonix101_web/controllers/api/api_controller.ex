defmodule Pheonix101Web.ApiController do
  use Pheonix101Web, :controller

  def index(conn, _params) do
    json(
      conn,
      %{
        status_code: 200,
        message: "The api is working fine."
      }
    )
  end
end
