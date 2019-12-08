defmodule FuelCalculatorTest do
  use ExUnit.Case

  test "It calculates manhattan distance" do
    assert AdventOfCode.CrossedWires.calculate_manhattan_distance({5, 1}) == 6
    assert AdventOfCode.CrossedWires.calculate_manhattan_distance({-5, 1}) == 6
  end

  test "It calculates miniumum manhattan distance" do
    assert AdventOfCode.CrossedWires.calculate_minimum_manhattan_distance(
             MapSet.new([{1, 5}, {20, 30}, {10, 15}])
           ) == {1, 5}
  end

  test "It calculates nearest intersection" do
    assert AdventOfCode.CrossedWires.calculate_nearest_intersection(
             ["R75", "D30", "R83", "U83", "L12", "D49", "R71", "U7", "L72"],
             ["U62", "R66", "U55", "R34", "D71", "R55", "D58", "R83"]
           ) == 159
  end
end
