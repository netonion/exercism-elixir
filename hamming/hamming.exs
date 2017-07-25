defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do
    {:error, "Lists must be the same length"}
  end

  def hamming_distance(strand1, strand2), do: {:ok, hamming(strand1, strand2)}
  defp hamming([], []), do: 0
  defp hamming([h | t1], [h | t2]), do: hamming(t1, t2)
  defp hamming([_ | t1], [_ | t2]), do: 1 + hamming(t1, t2)
end
