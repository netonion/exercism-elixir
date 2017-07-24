defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise ArgumentError, message: "Count must be greater than 0"
  def nth(count) do
    2..1000 |> Enum.to_list |> primes |> Enum.at(count - 1)
  end

  defp primes([]), do: []
  defp primes([head | tail]) do
    [head | tail |> Enum.filter(&(rem(&1, head) != 0)) |> primes]
  end
end
