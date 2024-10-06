defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers)-1)
  end

  defp search(numbers, key, start_idx, end_idx) when start_idx <= end_idx do
    mid_idx = Integer.floor_div(end_idx + start_idx, 2)
    mid_elem = elem(numbers, mid_idx)
    cond do
      mid_elem == key -> {:ok, mid_idx}
      mid_elem > key -> search(numbers, key, start_idx, mid_idx - 1)
      true -> search(numbers, key, mid_idx + 1, end_idx)
    end
  end

  defp search(_numbers, _key, start_idx, end_idx) when start_idx > end_idx do
    :not_found
  end
end
