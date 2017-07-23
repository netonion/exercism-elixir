defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.codepoints
    |> Enum.reduce([], fn
      x, acc when x in ["[", "{", "("] -> [x | acc] # push opening bracket to stack
      "]", ["[" | acc] -> acc # pop matching opening bracket from stack
      "}", ["{" | acc] -> acc
      ")", ["(" | acc] -> acc
      x, _ when x in ["]", "}", ")"] -> [false] # unmatched bracket. just fail
      _, acc -> acc # irrelevant chars
    end)
    |> Enum.empty? # stack should be empty
  end
end
