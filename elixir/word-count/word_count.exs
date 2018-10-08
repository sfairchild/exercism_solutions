defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  @only_words ~r/[^[:alnum:]-]/u

  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(@only_words, trim: true)
    |> Enum.reduce(%{}, fn word, m -> Map.update(m, word, 1, &(&1 + 1)) end)
  end
end
