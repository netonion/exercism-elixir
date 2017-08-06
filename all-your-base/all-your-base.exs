defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b) when digits == [] or base_a < 2 or base_b < 2, do: nil
  def convert(digits, base_a, base_b), do: digits |> to_i(base_a, 0) |> to_b(base_b, [])

  defp to_i([], _, acc), do: acc
  defp to_i([head | tail], base, acc) when head in 0..base-1, do: to_i(tail, base, acc * base + head)
  defp to_i(_, _, _), do: nil

  defp to_b(nil, _, _), do: nil
  defp to_b(n, base, acc) when n < base, do: [n | acc]
  defp to_b(n, base, acc ), do: to_b(div(n, base), base, [rem(n, base) | acc])
end
