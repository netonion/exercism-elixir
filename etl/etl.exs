defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input), do: input |> Enum.reduce(%{}, &reducer/2)
  defp reducer({_, []}, acc), do: acc
  defp reducer({k, [v | vs]}, acc), do: reducer({k, vs}, Map.put(acc, String.downcase(v), k))
end
