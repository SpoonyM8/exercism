defmodule Username do
  def sanitize([]), do: []
  def sanitize([first_char | tail]) do
    cleaned = case first_char do
      first_char when first_char <= ?z and first_char >= ?a -> [first_char]
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      ?_ -> ~c"_"
      _ -> ~c""
    end
    cleaned ++ sanitize(tail)
  end
end
