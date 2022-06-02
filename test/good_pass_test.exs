defmodule GoodPassTest do
  use ExUnit.Case
  doctest GoodPass

  describe "goog_pass/1" do
    test "returns true if the password has 8 characters containing uppercase, lowercase, numbers and symbols." do
      assert GoodPass.good_password?("G0odP4$5word") == true
    end

    test "returns false if the password not has 8 characters containing uppercase, lowercase, numbers and symbols." do
      assert GoodPass.good_password?("BadPassword") == false
    end
  end
end
