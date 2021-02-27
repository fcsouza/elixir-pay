defmodule ElixirpayWeb.AccountController do
  use ElixirpayWeb, :controller

  alias Elixirpay.{ Account}

  action_fallback ElixirpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account}  <- Elixirpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", %{account: account})
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
