defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) when number in 1..64, do: {:ok, _square(number)}
  def square(_), do: { :error, "The requested square must be between 1 and 64 (inclusive)" }
  defp _square(1), do: 1
  defp _square(n), do: 2 * _square(n - 1)

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    {:ok, 1..64 |> Enum.map(&_square/1) |> Enum.sum}
  end
end
