defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    f = fn
      x when x in ?a..?z -> ?a + rem(x + shift - ?a, 26)
      x when x in ?A..?Z -> ?A + rem(x + shift - ?A, 26)
      x -> x
    end

    text |> String.to_charlist |> Enum.map(f) |> List.to_string
  end
end

