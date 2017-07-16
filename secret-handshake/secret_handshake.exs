defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    <<r::1, d::1, c::1, b::1, a::1>> = <<code::5>>
    commands =
      [{a, "wink"}, {b, "double blink"}, {c, "close your eyes"}, {d, "jump"}]
      |> Enum.filter_map(fn {x, _} -> x == 1 end, fn {_, x} -> x end)
    r == 1 && Enum.reverse(commands) || commands
  end
end
