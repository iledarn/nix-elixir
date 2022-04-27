defmodule Fib do
  def number(n) do
    fib1 = 0
    fib2 = 1
    2..n |> Enum.each(fn _i ->
      fib = fib1 + fib2
      fib1 = fib2
      fib2 = fib
    end)
    fib2
  end
end

Fib.number(5)
