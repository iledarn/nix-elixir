defmodule Lasagna do

  @minutes_in_oven 40
  @each_layer_takes 2

  def expected_minutes_in_oven() do
    @minutes_in_oven
  end

  def remaining_minutes_in_oven(actual_minutes) do
    expected_minutes_in_oven() - actual_minutes
  end

  def preparation_time_in_minutes(number_of_layers) do
    number_of_layers * @each_layer_takes
  end

  def total_time_in_minutes(number_of_layers, has_been_in_oven) do
    preparation_time_in_minutes(number_of_layers) + has_been_in_oven
  end

  def alarm() do
    "Ding!"
  end
end
