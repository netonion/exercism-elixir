defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    f = fn x ->
      cond do
        String.starts_with?(x, ["a", "e", "i", "o", "u", "yt", "xr"]) ->
          x <> "ay"
        String.starts_with?(x, ["squ", "thr", "sch"]) ->
          {c, rest} = String.split_at(x, 3)
          rest <> c <> "ay"
        String.starts_with?(x, ["ch", "qu", "th"]) ->
          {c, rest} = String.split_at(x, 2)
          rest <> c <> "ay"
        true ->
          {c, rest} = String.split_at(x, 1)
          rest <> c <> "ay"
      end
    end

    phrase |> String.split |> Enum.map(f) |> Enum.join(" ")
  end
end

