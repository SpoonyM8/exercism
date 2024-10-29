defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    trimmed_input = String.trim(input)
    cond do
      empty?(trimmed_input) -> "Fine. Be that way!"
      question?(trimmed_input) and caps?(trimmed_input) -> "Calm down, I know what I'm doing!"
      question?(trimmed_input) -> "Sure."
      caps?(trimmed_input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp empty?(input), do: String.length(input) == 0

  defp caps?(input), do: String.upcase(input) == input and String.downcase(input) != input

  defp question?(input), do: String.last(input) == "?"
end
