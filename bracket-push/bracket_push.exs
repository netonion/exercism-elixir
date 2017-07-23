defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str |> String.codepoints |> _check([])
  end

  defp _check([], []), do: true
  defp _check([], _), do: false

  defp _check([head | tail], stack) when head in ["[", "{", "("] do
    _check(tail, [head | stack])
  end

  defp _check(["]" | tail], ["[" | stack]), do: _check(tail, stack)
  defp _check(["]" | _], _), do: false

  defp _check(["}" | tail], ["{" | stack]), do: _check(tail, stack)
  defp _check(["}" | _], _), do: false

  defp _check([")" | tail], ["(" | stack]), do: _check(tail, stack)
  defp _check([")" | _], _), do: false

  defp _check([_ | tail], stack), do: _check(tail, stack)
end
