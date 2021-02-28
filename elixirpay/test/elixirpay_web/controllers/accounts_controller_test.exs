defmodule ElixirpayWeb.AccountsControllerTest do
  use ElixirpayWeb.ConnCase, async: true

  alias Elixirpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Fabricio",
        password: "123456",
        nickname: "fabricio",
        email: "fabricio@banana.com",
        age: 27
      }

      {:ok, %User{account: %Account{id: account_id}}} = Elixirpay.create_user(params)

      encoded_auth_basic = Base.encode64("admin:admin123")

      conn = put_req_header(conn, "authorization", "Basic #{encoded_auth_basic}")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{"balance" => "50.00", "id" => _id},
               "message" => "Balance changed successfully"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end
end