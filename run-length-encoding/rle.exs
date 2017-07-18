defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    # reduce string to [{A, 2}, {B, 3}, ...] in reversed order
    reducer = fn
      x, [{x, n} | rest] -> [{x, n + 1} | rest]
      x, acc -> [{x, 1} | acc]
    end

    mapper = fn
      {x, 1} -> x
      {x, n} -> "#{n}#{x}"
    end

    string
    |> String.codepoints
    |> Enum.reduce([], reducer)
    |> Enum.reverse
    |> Enum.map(mapper)
    |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode(string) do

  end
end
