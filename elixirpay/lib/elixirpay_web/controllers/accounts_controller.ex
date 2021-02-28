defmodule ElixirpayWeb.AccountsController do
  use ElixirpayWeb, :controller

  alias Elixirpay.Account
  alias Elixirpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback ElixirpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Elixirpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Elixirpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Elixirpay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
