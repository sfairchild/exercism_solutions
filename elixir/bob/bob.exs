defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      yelling?(input) && questioning?(input) -> "Calm down, I know what I'm doing!"
      yelling?(input) -> "Whoa, chill out!"
      questioning?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp yelling?(input) do
    input == String.upcase(input) && input != String.downcase(input)
  end

  defp questioning?(input), do: String.ends_with?(input, "?")

  defp silence?(input), do: String.trim(input) == ""
end
