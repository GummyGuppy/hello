defmodule HelloWeb.HelloHTML do
  use HelloWeb, :html

@doc """

***Template files are compiled into the module as function components
 themselves, there is no runtime or performance difference between
 the two styles. ***

OPTION 1: Function component with HEEx (Embedded Elixir).
  "HTML+EEx" is a Phoenix extension of EEx that is HTML aware,
  with support for HTML validation, components,
  and automatic escaping of values.
  The latter protects you from security vulnerabilities like
  Cross-Site-Scripting with no extra work on your part.


  def index(assigns) do
    ~H\"""
    Hello!
    \"""
  end



OPTION 2: Template File.
  A template file works in the same way.
  Function components are great for smaller templates
  and separate files are a good choice when you have a lot of markup
  or your functions start to feel unmanageable.

  Requires a seperate file, found here:

  lib/hello_web
  ├── controllers
  │   ├── hello_controller.ex
  │   ├── hello_html.ex
  │   ├── hello_html
  |       ├── index.html.heex

  File name structured as: NAME.FORMAT.TEMPLATING_LANGUAGE



"""




embed_templates "hello_html/*"


end
