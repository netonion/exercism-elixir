defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(0), do: ""
  def numerals(number) when number in 1..3, do: String.duplicate("I", number)
  def numerals(4), do: "IV"
  def numerals(number) when number in 5..8, do: "V" <> String.duplicate("I", number - 5)
  def numerals(9), do: "IX"

  def numerals(number) when number in 10..39, do: String.duplicate("X", div(number, 10)) <> numerals(rem(number, 10))
  def numerals(number) when number in 40..49, do: "XL" <> numerals(number - 40)
  def numerals(number) when number in 50..89, do: "L" <> String.duplicate("X", div(number - 50, 10)) <> numerals(rem(number, 10))
  def numerals(number) when number in 90..99, do: "XC" <> numerals(number - 90)

  def numerals(number) when number in 100..399, do: String.duplicate("C", div(number, 100)) <> numerals(rem(number, 100))
  def numerals(number) when number in 400..499, do: "CD" <> numerals(number - 400)
  def numerals(number) when number in 500..899, do: "D" <> String.duplicate("C", div(number - 500, 100)) <> numerals(rem(number, 100))
  def numerals(number) when number in 900..999, do: "CM" <> numerals(number - 900)

  def numerals(number) when number >= 1000, do: String.duplicate("M", div(number, 1000)) <> numerals(rem(number, 1000))
end
