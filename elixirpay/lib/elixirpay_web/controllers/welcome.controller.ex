defmodule ElixirpayWeb.WelcomeController do
  use ElixirpayWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to ElixirPay API")
  end
end
