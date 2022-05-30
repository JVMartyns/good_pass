defmodule GoodPass do
  @alphabet Enum.to_list(?A..?z) -- '[\\]^_`'
  @numbers Enum.to_list(?0..?9)
  @symbols '!@$!%*?&'
  @regex ~r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/

  def generate(len \\ 12) do
    cond do
      len < 8 ->
        {:error, "Password must be at least 8 characters long"}

      len >= 8 ->
        if good_password?(password = gen_password(len)) do
          {:ok, password}
        else
          generate(len)
        end
    end
  end

  defp gen_password(len) do
    password =
      for _ <- Enum.to_list(1..len) do
        Enum.random([@alphabet, @numbers, @symbols])
        |> Enum.random()
      end

    List.to_string(password)
  end

  defp good_password?(password) do
    String.match?(password, @regex)
  end
end
