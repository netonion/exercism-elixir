defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t) :: String.t
  def parse(m) do
    m
    |> String.split("\n")
    |> Enum.map_join(fn
        "#"  <> rest -> header_tag(rest, 1)
        "* " <> rest -> "<li>#{rest}</li>"
                rest -> "<p>#{rest}</p>"
       end)
    |> replace_md
  end

  defp header_tag(" " <> rest, acc), do: "<h#{acc}>#{rest}</h#{acc}>"
  defp header_tag("#" <> rest, acc), do: header_tag(rest, acc + 1)

  defp replace_md(m) do
    m
    |> String.replace(~r/__(.*?)__/, "<strong>\\1</strong>")
    |> String.replace(~r/_(.*?)_/, "<em>\\1</em>")
    |> String.replace(~r/(?<!<\/li>)<li>.*<\/li>(?!<li>)/, "<ul>\\0</ul>")
  end
end
