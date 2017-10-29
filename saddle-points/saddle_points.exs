defmodule SaddlePoints do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str
    |> String.split("\n")
    |> Enum.map(fn row -> String.split(row) |> Enum.map(&String.to_integer/1) end)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    rows(str)
    |> Enum.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    maxs = rows(str) |> Enum.map(&Enum.max/1) |> Enum.with_index
    mins = columns(str) |> Enum.map(&Enum.min/1) |> Enum.with_index
    for {max, i} <- maxs, {min, j} <- mins, max == min, do: {i, j}
  end
end
