defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Enum.join
    |> String.downcase
    |> String.replace(~r/[\W\d]/u, "")
    |> String.graphemes
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1+1)) end)
  end
end
