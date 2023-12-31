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
