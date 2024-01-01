defmodule HelloWeb.Router do

  # The first line of this module, use HelloWeb, :router,
  # simply makes Phoenix router functions available in our
  # particular router.
  use HelloWeb, :router

  # Pipelines are a series of plugs that can be attached to specific scopes.
  # ex. pipeline :browser, :api

  # You can create as few or as many scopes as you want.
  # Because pipelines are reusable across scopes, they help encapsulate common functionality
  # and you can compose them as necessary on each scope you define.

  @doc """
    The :browser pipeline has six plugs:
    The plug :accepts, ["html"] defines the accepted request format or formats.
    :fetch_session, which, naturally, fetches the session data and makes it available in the connection.
    :fetch_live_flash, which fetches any flash messages from LiveView and merges them with the controller flash messages.
    Then, the plug :put_root_layout will store the root layout for rendering purposes.
    Later :protect_from_forgery and :put_secure_browser_headers, protects form posts from cross-site forgery.
  """
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HelloWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug HelloWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

 # ~~ ROOT SCOPE ~~
  scope "/", HelloWeb do

    #pipelines allow a set of plugs to be applied to different sets of routes.
    pipe_through :browser

    # get is a Phoenix macro that corresponds to the HTTP verb GET.
    # Similar macros exist for other HTTP verbs, including POST, PUT, PATCH, DELETE, OPTIONS, CONNECT, TRACE, and HEAD
    get "/", PageController, :home
    get "/redirect_test", PageController, :redirect_test


    resources "/users", UserController do
      resources "/posts", PostController
    end

    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/reviews", ReviewController
  end





  # ~~ ADMIN SCOPE ~~
  # We define a new scope where all routes are prefixed with /admin and all controllers are
  # under the HelloWeb.Admin namespace.
  # scope "/admin", HelloWeb.Admin do
  #   pipe_through :browser

  #   resources "/images",  ImageController
  #   resources "/reviews", ReviewController
  #   resources "/users",   UserController
  # end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:hello, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: HelloWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
