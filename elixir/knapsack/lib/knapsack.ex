defmodule Knapsack do
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(items :: [%{value: integer, weight: integer}], maximum_weight :: integer) ::
          integer
  def maximum_value([%{value: value, weight: weight} | tail], maximum_weight) do
    new_weight = maximum_weight - weight
    if new_weight < 0 do
      maximum_value(tail, maximum_weight)
    else
      max(value + maximum_value(tail, maximum_weight - weight), maximum_value(tail, maximum_weight))
    end

  end
  def maximum_value([], _maximum_weight), do: 0
end
