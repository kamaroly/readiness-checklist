defmodule ReadinessWeb.PageController do
  use ReadinessWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
