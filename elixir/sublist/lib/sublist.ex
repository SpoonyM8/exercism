defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      equal?(a, b) -> :equal
      sublist?(a, b) -> :sublist
      superlist?(a, b) -> :superlist
      true -> :unequal
    end
  end

  defp equal?(a,b), do: a == b

  defp sublist?([], _), do: true
  defp sublist?(_, []), do: false
  defp sublist?(l1, l2 = [_ | l2tail]) do
    List.starts_with?(l2, l1) or sublist?(l1, l2tail)
  end

  defp superlist?(a,b), do: sublist?(b, a)
end
