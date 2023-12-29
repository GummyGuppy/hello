

defmodule HelloWeb.Plugs.Locale do
  import Plug.Conn

  @locales ["en", "fr", "de"]

  def init(default), do: default

@doc """
  We also use pattern matching to define multiple call/2 function
  heads to validate the locale in the params, and fall back to
  "en" if there is no match
"""
  def call(%Plug.Conn{params: %{"locale" => loc}} = conn, _default) when loc in @locales do

    assign(conn, :locale, loc)
  end

  def call(conn, default) do
    assign(conn, :locale, default)
  end
end
