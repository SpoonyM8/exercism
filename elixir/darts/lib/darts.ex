defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    cond do
      distance_from_centre(x, y) > 10 -> 0
      distance_from_centre(x, y) > 5 -> 1
      distance_from_centre(x, y) > 1 -> 5
      true -> 10
    end
  end

  defp distance_from_centre(x, y) do
    (x ** 2 + y ** 2) ** 0.5
  end
end
