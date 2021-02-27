defmodule ElixirpayWeb.UsersController do
  use ElixirpayWeb, :controller

  alias Elixirpay.User

  alias Elixirpay.User

  action_fallback ElixirpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user}  <- Elixirpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", %{user: user})
    end
  end

  def list(conn, _params) do
    with users  <- Elixirpay.list_user() do
      conn
      |> put_status(:ok)
      |> render("list.json", %{users: users})
    end

  end

end
