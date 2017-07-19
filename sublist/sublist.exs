defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      length(a) < length(b) && check(a, b) -> :sublist
      length(a) > length(b) && check(b, a) -> :superlist
      true -> :unequal
    end
  end

  def check(s, l) when length(s) > length(l), do: false
  def check(s, l) do
    Enum.take(l, length(s)) === s || check(s, tl(l))
  end
end
