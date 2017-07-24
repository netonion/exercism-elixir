defmodule Roman do
  @rules [{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
          { 100, "C"}, { 90, "XC"}, { 50, "L"}, { 40, "XL"},
          {  10, "X"}, {  9, "IX"}, {  5, "V"}, {  4, "IV"},
          {   1, "I"}]

  for {bound, roman} <- @rules do
    defp translate(number) when number >= unquote(bound) do
      unquote(roman) <> translate(number - unquote(bound))
    end
  end

  defp translate(0), do: ""

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number), do: translate(number)
end
