defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    input
    |> Enum.reduce(%{}, fn line, acc ->
      case line |> String.split(";") do
        [a, b, "win"] ->
          acc |> Map.update(a, %{mp: 1, w: 1, d: 0, l: 0, p: 3}, fn x -> x |> Map.merge(%{mp: x.mp + 1, w: x.w + 1, p: x.p + 3}) end)
              |> Map.update(b, %{mp: 1, w: 0, d: 0, l: 1, p: 0}, fn x -> x |> Map.merge(%{mp: x.mp + 1, l: x.l + 1, p: x.p + 0}) end)
        [a, b, "loss"] ->
          acc |> Map.update(a, %{mp: 1, w: 0, d: 0, l: 1, p: 0}, fn x -> x |> Map.merge(%{mp: x.mp + 1, l: x.l + 1, p: x.p + 0}) end)
              |> Map.update(b, %{mp: 1, w: 1, d: 0, l: 0, p: 3}, fn x -> x |> Map.merge(%{mp: x.mp + 1, w: x.w + 1, p: x.p + 3}) end)
        [a, b, "draw"] ->
          acc |> Map.update(a, %{mp: 1, w: 0, d: 1, l: 0, p: 1}, fn x -> x |> Map.merge(%{mp: x.mp + 1, d: x.d + 1, p: x.p + 1}) end)
              |> Map.update(b, %{mp: 1, w: 0, d: 1, l: 0, p: 1}, fn x -> x |> Map.merge(%{mp: x.mp + 1, d: x.d + 1, p: x.p + 1}) end)
        _ -> acc
      end
    end)
    |> Enum.sort(fn {x, xs}, {y, ys} -> xs.p >= ys.p && x <= y end)
    |> Enum.reduce("Team                           | MP |  W |  D |  L |  P\n", fn {x, xs}, acc ->
      acc <> x <> String.duplicate(" ", 31 - String.length(x)) <> "|  " <> to_string(xs.mp) <> " |  " <> to_string(xs.w) <> " |  " <> to_string(xs.d) <> " |  " <> to_string(xs.l) <> " |  " <> to_string(xs.p) <> "\n"
    end)
    |> String.trim
  end
end
