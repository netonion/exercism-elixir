defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    s = [{'Pling', rem(number, 3)}, {'Plang', rem(number, 5)}, {'Plong', rem(number, 7)}]
        |> Enum.filter_map(fn {_, x} -> x == 0 end, fn {x, _} -> x end)
        |> Enum.join

    if s == "" do to_string(number) else s end
  end
end
