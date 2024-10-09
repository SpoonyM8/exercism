defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    if(radicand == 1, do: 1, else: calculate(radicand, Kernel.div(radicand, 2)))

  end

  defp calculate(radicand, guess) do
    if(guess * guess == radicand, do: guess, else: calculate(radicand, guess - 1))
  end
end
