defmodule Garden do
  @students ~w[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry]a
  @mappings %{"V" => :violets, "C" => :clover, "G" => :grass, "R" => :radishes}
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @students) do
    info_string
    |> String.split("\n")
    |> Enum.map(fn line ->
      line
      |> String.codepoints
      |> Kernel.++(List.duplicate("X", length(student_names) * 2 - String.length(line)))
      |> Enum.map(&@mappings[&1])
      |> Enum.chunk(2)
    end)
    |> Enum.zip
    |> Enum.zip(student_names |> Enum.sort)
    |> Map.new(fn
         {{[nil, nil], [nil, nil]}, student} -> {student, {}}
         {{[a, b], [c, d]}, student} -> {student, {a, b, c, d}}
       end)
  end
end
