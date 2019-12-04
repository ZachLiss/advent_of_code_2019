defmodule FuelCalculatorTest do
  use ExUnit.Case

  test "It calculates required fuel" do
    assert AdventOfCode.FuelCalculator.calculate_fuel(12) == 2
    assert AdventOfCode.FuelCalculator.calculate_fuel(14) == 2
    assert AdventOfCode.FuelCalculator.calculate_fuel(1969) == 654
    assert AdventOfCode.FuelCalculator.calculate_fuel(100_756) == 33583
  end

  test "It sums fuel needs for a list of masses" do
    assert AdventOfCode.FuelCalculator.calculate_fuel([12, 14, 1969, 100_756]) == 34241
  end
end
