defmodule Elixirpay do
  alias Elixirpay.Users.Create, as: UserCreate
  alias Elixirpay.Users.List, as: UserList
  alias Elixirpay.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate list_user(), to: UserList, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
