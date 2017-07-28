defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    decimal(string, 0)
  end
  defp decimal("", acc), do: acc
  defp decimal("1" <> rest, acc), do: decimal(rest, 2 * acc + 1)
  defp decimal("0" <> rest, acc), do: decimal(rest, 2 * acc)
  defp decimal(_, _), do: 0
end
