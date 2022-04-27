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

  def has_day_without_birds?([head | tail]) do
    case head == 0 do
      true -> true
      _ -> has_day_without_birds?(tail) == true
    end
  end

  def total([]) do
    0
  end

  def total([head | tail]) do
    total(tail) + head
  end

  def busy_days([]) do
    0
  end

  def busy_days([head | tail]) do
    case head >= 5 do
      true -> 1 + busy_days(tail)
      _ -> busy_days(tail)
    end
  end
end
