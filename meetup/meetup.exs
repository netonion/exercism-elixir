defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """
  @weekdays ~w[monday tuesday wednesday thursday friday saturday sunday]a

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, :teenth), do:
    find_weekday(year, month, weekday, 13..19)
  def meetup(year, month, weekday, :first), do:
    find_weekday(year, month, weekday, 1..7)
  def meetup(year, month, weekday, :second), do:
    find_weekday(year, month, weekday, 8..14)
  def meetup(year, month, weekday, :third), do:
    find_weekday(year, month, weekday, 15..21)
  def meetup(year, month, weekday, :fourth), do:
    find_weekday(year, month, weekday, 22..28)
  def meetup(year, month, weekday, :last) do
    last_day = :calendar.last_day_of_the_month(year, month)
    find_weekday(year, month, weekday, last_day - 6 .. last_day)
  end

  defp find_weekday(year, month, weekday, range) do
    range
    |> Enum.map(&Date.from_erl!({year, month, &1}))
    |> Enum.find(fn date ->
      Enum.at(@weekdays, Date.day_of_week(date) - 1) == weekday
    end)
    |> Date.to_erl
  end
end
