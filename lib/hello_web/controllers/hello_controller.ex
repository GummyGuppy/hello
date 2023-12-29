defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  @doc """
    The keys of the params map will always be strings,
    and that the equals sign does not represent assignment,
    but is instead a pattern match assertion.

    %{"messenger" => messenger}

  """
  def show(conn, %{"messenger" => messenger}) do
    render(conn, :show, messenger: messenger)
  end
end
