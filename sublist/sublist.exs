defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    d = length(a) - length(b)
    cond do
      a == b -> :equal
      d < 0 && Enum.any?(0..-d, &check(&1, a, b)) -> :sublist
      d > 0 && Enum.any?(0..d, &check(&1, b, a)) -> :superlist
      true -> :unequal
    end
  end

  def check(pos, short, long) do
    Enum.slice(long, pos, length(short)) === short
  end
end
