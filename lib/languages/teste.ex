defmodule Teste do
  @language "lib/languages/de.txt"
  def test1 do
    {:ok, file} = File.read(@language)

    content =
      file
      |> String.split("\n", trim: true)
      |> Enum.reject(&String.match?(&1, ~r/[-]/))
      |> Enum.join("\n")

    File.write(@language, content)
  end
end
