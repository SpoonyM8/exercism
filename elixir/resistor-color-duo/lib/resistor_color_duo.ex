defmodule ResistorColorDuo do
  @color_encodings %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([tens, singles | _rest]), do: Map.get(@color_encodings, tens) * 10 + Map.get(@color_encodings, singles)
end
