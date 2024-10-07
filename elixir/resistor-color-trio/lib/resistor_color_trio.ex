defmodule ResistorColorTrio do
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
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([colour_1, colour_2, colour_3 | _tail]) do
    num = String.to_integer("#{Map.get(@color_encodings, colour_1)}#{Map.get(@color_encodings, colour_2)}#{String.duplicate("0", Map.get(@color_encodings, colour_3))}")
    cond do
      num < 1000 -> {num, :ohms}
      rem(num, 1000000000) == 0 -> {div(num, 1000000000), :gigaohms}
      rem(num, 1000000) == 0 -> {div(num, 1000000), :megaohms}
      rem(num, 1000) == 0 -> {div(num, 1000), :kiloohms}
    end
  end
end
