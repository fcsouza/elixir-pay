defmodule ElixirpayWeb.UsersViewTest do
  use ElixirpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Elixirpay.{Account, User}
  alias ElixirpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Fabricio",
      password: "123456",
      nickname: "fabricio",
      email: "fabricio@banana.com",
      age: 27
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Elixirpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Fabricio",
        nickname: "fabricio"
      }
    }

    assert expected_response == response
  end
end
