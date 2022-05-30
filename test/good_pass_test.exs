defmodule GoodPassTest do
  use ExUnit.Case
  doctest GoodPass

  test "greets the world" do
    assert GoodPass.hello() == :world
  end
end
