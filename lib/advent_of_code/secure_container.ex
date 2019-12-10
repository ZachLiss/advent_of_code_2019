defmodule AdventOfCode.SecureContainer do
  """
  It is a six-digit number.
  The value is within the range given in your puzzle input.
  Two adjacent digits are the same (like 22 in 122345).
  Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).

  307237-769058
  """

  def compute() do
    307_237..769_058
    |> Stream.filter(&correct_number_of_digits(&1, 6))
    |> Stream.filter(&adjacent_digits/1)
    |> Stream.filter(&never_decrease/1)
    |> Enum.to_list()
    |> length()
  end

  def correct_number_of_digits(number, expected_digit_count) do
    expected_digit_count == number_of_digits(number)
  end

  def adjacent_digits(number) do
    uniq_digits =
      number
      |> to_string
      |> String.splitter("", trim: true)
      |> Enum.uniq()
      |> length()

    number_of_digits(number) != uniq_digits
  end

  def never_decrease(number) when is_integer(number) do
    number
    |> to_string()
    |> String.splitter("", trim: true)
    |> Stream.map(&String.to_integer(&1))
    |> Enum.to_list()
    |> never_decrease()
  end

  def never_decrease([a, b]) do
    a <= b
  end

  def never_decrease([a | [b | _] = tail]) do
    a <= b && never_decrease(tail)
  end

  defp number_of_digits(number) do
    number |> to_string |> String.length()
  end
end
