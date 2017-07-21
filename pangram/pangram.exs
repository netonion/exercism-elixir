defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    a_to_z = Enum.to_list(?a..?z) |> List.to_string

    sentence
    |> String.downcase
    |> String.codepoints
    |> Enum.uniq
    |> Enum.sort
    |> Enum.join
    |> String.contains?(a_to_z)
  end
end
