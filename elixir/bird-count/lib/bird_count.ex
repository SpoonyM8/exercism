defmodule BirdCount do

  def today([]), do: nil
  def today(list) do
    hd(list)
  end

  def increment_day_count([]), do: [1]
  def increment_day_count(list) do
    [today(list) + 1 | tl(list)]
  end

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)

  def total([]), do: 0
  def total(list) do
    today(list) + total(tl(list))
  end

  def busy_days([]), do: 0
  def busy_days([head | tail]) when head >= 5, do: 1 + busy_days(tail)
  def busy_days([_ | tail]), do: busy_days(tail)
end
