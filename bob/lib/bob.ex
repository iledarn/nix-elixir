defmodule Bob do
  def hey(input) do
    cond do
      address_without_saying?(input) -> "Fine. Be that way!"
      yell_question?(input) -> "Calm down, I know what I'm doing!"
      ask_question?(input) -> "Sure."
      yell?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp ask_question?(input) do
    input
    |> String.trim()
    |> String.ends_with?("?")
  end

  defp yell?(input) do
    String.upcase(input) == input && String.upcase(input) != String.downcase(input)
  end

  defp yell_question?(input) do
    yell?(input) && ask_question?(input)
  end

  defp address_without_saying?(input) do
    input
    |> String.trim()
    |> String.length() == 0
  end
end
