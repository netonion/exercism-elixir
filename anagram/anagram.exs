defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base = base |> String.downcase

    is_anagram? = fn x ->
      x = x |> String.downcase
      x != base &&
      x |> String.codepoints |> Enum.sort == base |> String.codepoints |> Enum.sort
    end

    candidates |> Enum.filter(is_anagram?)
  end
end
