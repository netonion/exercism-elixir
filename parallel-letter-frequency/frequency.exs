defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Task.async_stream(fn text ->
      text
      |> String.downcase
      |> String.replace(~r/[\W\d]/u, "")
      |> String.graphemes
      |> Enum.reduce(%{}, fn char, acc -> Map.update(acc, char, 1, &(&1 + 1)) end)
    end, max_concurrency: workers)
    |> Enum.reduce(%{}, fn {:ok, res}, acc ->
      Map.merge(acc, res, fn _k, v1, v2 -> v1 + v2 end)
    end)
  end
end
