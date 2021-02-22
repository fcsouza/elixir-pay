defmodule Elixirpay.NumbersTest do
  use ExUnit.Case

  alias Elixirpay.Numbers

  describe "sum_from_file/1" do
    test "it should be able to sum integers in a file" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 40}}

      assert response == expected_response
    end

    test "it should not be able to sum integers in an invalid file" do
      response = Numbers.sum_from_file("banana")

      expected_response = {:error, %{message: "Invalid File"}}

      assert response == expected_response
    end
  end
end
