defmodule TwelveDays do
  @gifts ["twelve Drummers Drumming", "eleven Pipers Piping", "ten Lords-a-Leaping",
    "nine Ladies Dancing", "eight Maids-a-Milking", "seven Swans-a-Swimming",
    "six Geese-a-Laying", "five Gold Rings", "four Calling Birds",
    "three French Hens", "two Turtle Doves", "a Partridge in a Pear Tree"]

  @th ~w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    gifts = @gifts |> Enum.drop(12 - number) |> Enum.take(number - 1) |> Enum.join(", ")
    gifts = case number do
      1 -> gifts <> "a Partridge in a Pear Tree."
      _ -> gifts <> ", and a Partridge in a Pear Tree."
    end
    "On the #{Enum.at(@th, number - 1)} day of Christmas my true love gave to me, #{gifts}"
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    Enum.map(starting_verse..ending_verse, &verse/1) |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
    verses(1, 12)
  end
end

