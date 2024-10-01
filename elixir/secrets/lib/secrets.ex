defmodule Secrets do
  def secret_add(secret) do
    # Please implement the secret_add/1 function
    fn num -> secret + num end
  end

  def secret_subtract(secret) do
    # Please implement the secret_subtract/1 function
    fn num -> num - secret end
  end

  def secret_multiply(secret) do
    # Please implement the secret_multiply/1 function
    fn num -> secret * num end
  end

  def secret_divide(secret) do
    # Please implement the secret_divide/1 function
    fn num -> trunc(num / secret) end
  end

  def secret_and(secret) do
    # Please implement the secret_and/1 function
    fn num -> Bitwise.band(num, secret) end
  end

  def secret_xor(secret) do
    # Please implement the secret_xor/1 function
    fn num -> Bitwise.bxor(num, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    # Please implement the secret_combine/2 function
    fn num -> secret_function2.(secret_function1.(num)) end
  end
end
