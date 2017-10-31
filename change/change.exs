defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t}
  def generate(_, 0), do: {:ok, []}
  def generate(_, target) when target < 0, do: {:error, "cannot change"}
  def generate(coins, target) do
    1..target
    |> Enum.reduce(%{0 => []}, fn x, acc ->
      coins
      |> Enum.filter_map(&acc[x - &1], &[&1 | acc[x - &1]])
      |> Enum.min_by(&length/1, fn -> nil end)
      |> (&Map.put(acc, x, &1)).()
    end)
    |> Map.get(target)
    |> case do
      nil -> {:error, "cannot change"}
      changes -> {:ok, changes}
    end
  end
end
