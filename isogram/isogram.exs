defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.replace(~r/\W/, "")
    |> String.codepoints
    |> Enum.sort
    |> Enum.chunk_by(&(&1))
    |> Enum.all?(&(length(&1) == 1))
  end
end
