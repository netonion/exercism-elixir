defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    try do
      String.to_integer(string, 2)
    rescue
      ArgumentError -> 0
    end
  end
end
