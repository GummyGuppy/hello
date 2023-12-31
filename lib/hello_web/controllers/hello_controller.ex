defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  @doc """

  While we can name our actions whatever we like, there are conventions for action names which we should follow whenever possible. We went over these in the routing guide, but we'll take another quick look here.

    index - renders a list of all items of the given resource type
    show - renders an individual item by ID
    new - renders a form for creating a new item
    create - receives parameters for one new item and saves it in a data store
    edit - retrieves an individual item by ID and displays it in a form for editing
    update - receives parameters for one edited item and saves the item to a data store
    delete - receives an ID for an item to be deleted and deletes it from a data store
    Each of these actions takes two parameters, which will be provided by Phoenix behind the scenes.

  The first parameter is always conn, a struct which holds information about the request such as the host,
  path elements, port, query string, and much more. conn comes to Phoenix via Elixir's Plug middleware framework.
  More detailed information about conn can be found in the Plug.Conn documentation.

  The second parameter is params. Not surprisingly, this is a map which holds any parameters passed along
  in the HTTP request. It is a good practice to pattern match against parameters in the function signature to
  provide data in a simple package we can pass on to rendering.

  """



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
