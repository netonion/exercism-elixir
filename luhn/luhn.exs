defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number), do: number |> String.to_integer |> normal

  defp normal(0), do: 0
  defp normal(i), do: rem(i, 10) + double(div(i, 10))
  defp double(0), do: 0
  defp double(i) when rem(i, 10) > 4, do: rem(i, 10) * 2 - 9 + normal(div(i, 10))
  defp double(i), do: rem(i, 10) * 2 + normal(div(i, 10))

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number), do: rem(checksum(number), 10) == 0

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    x = number <> "0" |> checksum |> Kernel.*(9) |> rem(10)
    "#{number}#{x}"
  end
end
