defmodule RomanNumerals do
  @numerals %{
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  @numbers [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    roman = fn map, n, num -> String.duplicate(map[num], div(n, num)) end
    @numbers
    |> Enum.reduce({"", number}, fn (num, {letter, n}) -> {letter <> roman.(@numerals, n, num), rem(n, num)} end)
    |> elem(0)
  end
end
