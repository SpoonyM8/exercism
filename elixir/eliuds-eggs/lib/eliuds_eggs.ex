defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(""), do: 0
  def egg_count(<<bit::binary-size(1), rest_of_bits::binary>>) when bit == "1", do: 1 + egg_count(rest_of_bits)
  def egg_count(<<bit::binary-size(1), rest_of_bits::binary>>) when bit == "0", do: egg_count(rest_of_bits)
  def egg_count(number), do: egg_count(Integer.to_string(number, 2))
end
