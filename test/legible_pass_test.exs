defmodule GoodPass.LegiblePassTest do
  use ExUnit.Case

  alias GoodPass.LegiblePass

  @regex ~r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*\/?&])[A-Za-z\d@$!%*\/?&]{8,}$/

  describe "generate/2" do
    test "generates a password based on portuguese containing 12 characters" do
      assert {:ok, password} = LegiblePass.generate("pt", 12)
      assert String.length(password) == 12
      assert String.match?(password, @regex)
    end

    test "generates a password based on English containing 14 characters" do
      assert {:ok, password} = LegiblePass.generate("en", 14)
      assert String.length(password) == 14
      assert String.match?(password, @regex)
    end

    test "generates a password based on Spanish containing 16 characters" do
      assert {:ok, password} = LegiblePass.generate("es", 16)
      assert String.length(password) == 16
      assert String.match?(password, @regex)
    end

    test "generates a password based on German containing 20 characters" do
      assert {:ok, password} = LegiblePass.generate("de", 20)
      assert String.length(password) == 20
      assert String.match?(password, @regex)
    end

    test "when password length is invalid" do
      assert LegiblePass.generate("de", 5) == {:error, "Password length: minimum 10, maximum: 20"}
    end

    test "when the language is invalid" do
      assert LegiblePass.generate("gg", 10) == {:error, "language unavailable"}
    end
  end
end
