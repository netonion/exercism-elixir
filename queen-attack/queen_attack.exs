defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(white \\ {0, 3}, black \\ {7, 3})
  def new(same, same), do: raise ArgumentError
  def new(white, black), do: %Queens{white: white, black: black}

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(%Queens{white: {xw, yw}, black: {xb, yb}}) do
    List.duplicate("_", 64)
    |> List.replace_at(xw * 8 + yw, "W")
    |> List.replace_at(xb * 8 + yb, "B")
    |> Enum.chunk(8)
    |> Enum.map_join("\n", &Enum.join(&1, " "))
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{white: {xw, _}, black: {xw, _}}), do: true
  def can_attack?(%Queens{white: {_, yw}, black: {_, yw}}), do: true
  def can_attack?(%Queens{white: {xw, yw}, black: {xb, yb}}), do: abs(xw - yw) == abs(xb - yb)
end
