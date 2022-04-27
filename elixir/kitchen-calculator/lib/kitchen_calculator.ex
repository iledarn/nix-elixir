defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({:milliliter, volume}) do
    {:milliliter, volume}
  end

  def to_milliliter({:cup, volume}) do
    {:milliliter, 240 * volume}
  end

  def to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, 30 * volume}
  end

  def to_milliliter({:teaspoon, volume}) do
    {:milliliter, 5 * volume}
  end

  def to_milliliter({:tablespoon, volume}) do
    {:milliliter, 15 * volume}
  end

  def from_milliliter({:milliliter, volume}, :milliliter) do
    {:milliliter, volume}
  end

  def from_milliliter({:milliliter, volume}, :cup) do
    {:cup, volume / 240}
  end

  def from_milliliter({:milliliter, volume}, :fluid_ounce) do
    {:fluid_ounce, volume / 30}
  end

  def from_milliliter({:milliliter, volume}, :teaspoon) do
    {:teaspoon, volume / 5}
  end

  def from_milliliter({:milliliter, volume}, :tablespoon) do
    {:tablespoon, volume / 15}
  end

  def convert({from, volume}, to) do
    to_milliliter({from, volume})
    |> from_milliliter(to)
  end
end
