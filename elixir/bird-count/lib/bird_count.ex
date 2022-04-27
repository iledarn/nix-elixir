defmodule BirdCount do
  def today([]) do
    nil
  end

  def today([head | _tail]) do
    head
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?([]) do
    false
  end

  def has_day_without_birds?(list) do
    Enum.any?(list, fn x -> x == 0 end)
  end

  def total([]) do
    0
  end

  def total([head | tail]) do
    total(tail) + head
  end

  def busy_days(list) do
    list
    |> Enum.filter(fn x -> x >= 5 end)
    |> Enum.reduce(0, fn x, acc -> 1 + acc end)
  end
end
