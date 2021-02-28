defmodule Elixirpay do
  alias Elixirpay.Users.Create, as: UserCreate
  alias Elixirpay.Users.List, as: UserList

  alias Rocketpay.Accounts.{Deposit, Transaction, Withdraw}

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate list_user(), to: UserList, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
