defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount/100
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate_discounted = apply_discount(hourly_rate, discount)
    hourly_rate_discounted * 8 * 22
    |> Float.ceil(0)
    |> trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate_discounted = apply_discount(hourly_rate, discount)
    budget / (hourly_rate_discounted * 8)
    |> Float.floor(1)
  end
end
