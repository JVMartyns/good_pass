defmodule GoodPass.RandomPass do
  @alphabet Enum.to_list(?A..?z) -- '[\\]^_`'
  @numbers Enum.to_list(?0..?9)
  @symbols '!@$!%*?&'

  def generate(), do: gen_good_password(12)

  def generate(len) when len >= 8, do: gen_good_password(len)

  def generate(_len), do: {:error, "Password must be at least 8 characters long"}

  defp gen_good_password(len) do
    if GoodPass.good_password?(password = gen_password(len)) do
      {:ok, password}
    else
      generate(len)
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
end
