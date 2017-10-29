defmodule Hexadecimal do
  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    hex |> String.downcase |> String.to_charlist |> decimal(0)
  end

  defp decimal([], acc), do: acc
  defp decimal([head | tail], acc) when head in (?0..?9) do
    decimal(tail, acc * 16 + (head - ?0))
  end
  defp decimal([head | tail], acc) when head in (?a..?f) do
    decimal(tail, acc * 16 + (head - ?a + 10))
  end
  defp decimal(_, _), do: 0
end
