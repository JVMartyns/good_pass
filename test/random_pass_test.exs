defmodule GoodPass.RandomPassTest do
  use ExUnit.Case

  alias GoodPass.RandomPass

  @regex ~r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/

  describe "generate/0" do
    test "lenght of password" do
      {:ok, password} = RandomPass.generate()
      assert String.length(password) == 12
    end

    test "contains lowercase, uppercase, numbers and symbols" do
      {:ok, password} = RandomPass.generate()

      assert String.match?(password, @regex)
    end
  end

  describe "generate/1" do
    test "password with 8 characters" do
      assert {:ok, password} = RandomPass.generate(8)
      assert String.length(password) == 8
      assert String.match?(password, @regex)
    end

    test "password with 64 characters" do
      assert {:ok, password} = RandomPass.generate(64)
      assert String.length(password) == 64
      assert String.match?(password, @regex)
    end

    test "password with 128 characters" do
      assert {:ok, password} = RandomPass.generate(128)
      assert String.length(password) == 128
      assert String.match?(password, @regex)
    end

    test "password with 4 characters" do
      assert {:error, _message} = RandomPass.generate(4)
    end

    test "password with 6 characters" do
      assert {:error, _message} = RandomPass.generate(6)
    end
  end
end
