defmodule DNA do
  def encode_nucleotide(code_point) do
    encodings = %{
      ?\s => 0b0000,
      ?A => 0b0001,
      ?C => 0b0010,
      ?G => 0b0100,
      ?T => 0b1000
    }
    Map.get(encodings, code_point, 0)
  end

  def decode_nucleotide(encoded_code) do
    decodings = %{
      0b0000 => ?\s,
      0b0001 => ?A,
      0b0010 => ?C,
      0b0100 => ?G,
      0b1000 => ?T
    }
    Map.get(decodings, encoded_code)
  end

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode([], acc), do: acc
  defp do_encode([head | tail], acc) do
    do_encode(tail, <<acc::bitstring, encode_nucleotide(head)::size(4)>>)
  end

  def decode(dna), do: do_decode(dna, [])

  defp do_decode(<<>>, acc), do: acc
  defp do_decode(<<first_nucleic::size(4), rest::bitstring>>, acc) do
    do_decode(rest, acc ++ [decode_nucleotide(first_nucleic)])
  end
end
