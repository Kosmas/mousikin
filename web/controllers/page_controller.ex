defmodule Mousikin.PageController do
  use Mousikin.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
