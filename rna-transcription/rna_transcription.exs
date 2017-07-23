defmodule RNATranscription do
  @mappings %{
    ?A => ?U,
    ?C => ?G,
    ?T => ?A,
    ?G => ?C
  }

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |> Enum.map(&(@mappings[&1]))
  end
end
