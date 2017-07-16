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
    com = []
    reverse = false
    if code > 31 do
      code = code - 32 
    end
    if code > 15 do
      reverse = true
      code = code - 16
    end
    if code > 7 do
      com = ["jump"] ++ com
      code = code - 8
    end
    if code > 3 do
      com = ["close your eyes"] ++ com
      code = code - 4
    end
    if code > 1 do
      com = ["double blink"] ++ com
      code = code - 2
    end
    if code > 0 do
      com = ["wink"] ++ com
    end
    if reverse do
      com = Enum.reverse(com)
    end
    com
  end
end

