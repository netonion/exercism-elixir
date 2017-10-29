defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) do
    1..num |> Enum.scan([], fn _, acc -> [1 | magic(acc)] end)
  end

  @doc """
  Generate the next row less the first 1 based on the previous row.

  ## Examples
      iex > PascalsTriangle.magic([1, 2, 1])
      [3, 3, 1]
      iex > PascalsTriangle.magic([1, 3, 3, 1])
      [4, 6, 4, 1]
  """
  @spec magic([integer]) :: [integer]
  defp magic([first, second | tail]) do
    [first + second | magic([second | tail])]
  end
  defp magic(x), do: x # matches [] and [1]
end
