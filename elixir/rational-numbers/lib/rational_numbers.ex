defmodule RationalNumbers do
  @type rational :: {integer, integer}

  defp get_from_numerator(numerator, denominator) do
    cond do
      numerator == 0 -> 1
      true -> denominator
    end
  end
  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a_numerator, a_denominator}, {b_numerator, b_denominator}) do
    r_numerator = a_numerator * b_denominator + a_denominator * b_numerator
    r_denominator = get_from_numerator(r_numerator, a_denominator * b_denominator)
    reduce({r_numerator, r_denominator})
  end
  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a_numerator, a_denominator}, {b_numerator, b_denominator}) do
    r_numerator = a_numerator * b_denominator - b_numerator * a_denominator
    r_denominator = get_from_numerator(r_numerator, a_denominator * b_denominator)
    reduce({r_numerator, r_denominator})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a_numerator, a_denominator}, {b_numerator, b_denominator}) do
    r_numerator = a_numerator * b_numerator
    r_denominator = get_from_numerator(r_numerator, a_denominator * b_denominator)
    reduce({r_numerator, r_denominator})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a_numerator, a_denominator}, {b_numerator, b_denominator}) do
    reduce({a_numerator * b_denominator, b_numerator * a_denominator})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a_numerator, a_denominator}) do
    reduce({Kernel.abs(a_numerator), Kernel.abs(a_denominator)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a_numerator, a_denominator}, n) when n >= 0 do
    reduce({a_numerator ** n, a_denominator ** n})
  end

  def pow_rational({a_numerator, a_denominator}, n) do
    pow_rational({a_denominator, a_numerator}, Kernel.abs(n))
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {n_numerator, n_denominator}) do
    # for float:
    x ** (n_numerator / n_denominator)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a_numerator, a_denominator}) do
    rational_gcd = Integer.gcd(a_numerator, a_denominator)
    r_numerator = Kernel.div(a_numerator, rational_gcd)
    r_denominator = Kernel.div(a_denominator, rational_gcd)
    cond do
      r_denominator < 0 -> {r_numerator * -1, r_denominator * -1}
      true -> {r_numerator, r_denominator}
    end
  end

  IO.puts(3 / 1)
end
