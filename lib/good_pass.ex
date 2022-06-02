defmodule GoodPass do
  @regex ~r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*\/?&])[A-Za-z\d@$!%*\/?&]{8,}$/
  @replace %{
    "a" => "@",
    "A" => "4",
    "e" => "&",
    "E" => "3",
    "i" => "!",
    "I" => "1",
    "o" => "0",
    "O" => "#",
    "u" => "*",
    "L" => "/",
    "s" => "$",
    "S" => "5",
    "b" => "6"
  }

  def good_password?(password), do: String.match?(password, @regex)

  def encrypt(input) do
    @replace
    |> Enum.reduce(input, fn {key, value}, acc ->
      String.replace(acc, key, value)
    end)
  end
end
