defmodule GoodPass.LegiblePass do
  @directory_file "lib/languages/"
  @languages ["pt", "en", "es", "de"]
  @lenght 10..20

  def generate(language, len) when language in @languages and len in @lenght do
    gen_good_password(language, len)
  end

  def generate(language, _len) when language not in @languages do
    {:error, "language unavailable"}
  end

  def generate(_language, len) when len not in @lenght do
    {:error, "Password length: minimum 10, maximum: 20"}
  end

  defp gen_good_password(language, len) do
    if GoodPass.good_password?(password = gen_password(language, len)) do
      {:ok, password}
    else
      gen_good_password(language, len)
    end
  end

  defp gen_password(language, len) do
    language
    |> select_word(len)
    |> random_uppercase()
    |> GoodPass.encrypt()
  end

  defp select_word(language, len) do
    {:ok, file} = File.read(@directory_file <> language <> ".txt")

    file
    |> String.split("\n", trim: true)
    |> Enum.filter(&(String.length(&1) == len))
    |> Enum.random()
  end

  defp random_uppercase(word) do
    word
    |> String.split("", trim: true)
    |> Enum.map(&Enum.random([String.downcase(&1), String.upcase(&1)]))
    |> Enum.join()
  end
end
