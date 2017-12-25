defmodule BattleLogWeb.PageController do
  use BattleLogWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
