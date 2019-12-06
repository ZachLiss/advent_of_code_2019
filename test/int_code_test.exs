defmodule IntCodeTest do
  use ExUnit.Case

  """
  Here are the initial and final states of a few more small programs:

  1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
  2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
  2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
  1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.
  """

  test "It calculates IntCodes" do
    assert AdventOfCode.IntCode.calculate_code([1, 0, 0, 0, 99]) == [2, 0, 0, 0, 99]
    assert AdventOfCode.IntCode.calculate_code([2, 3, 0, 3, 99]) == [2, 3, 0, 6, 99]
    assert AdventOfCode.IntCode.calculate_code([2, 4, 4, 5, 99, 0]) == [2, 4, 4, 5, 99, 9801]

    assert AdventOfCode.IntCode.calculate_code([1, 1, 1, 4, 99, 5, 6, 0, 99]) == [
             30,
             1,
             1,
             4,
             2,
             5,
             6,
             0,
             99
           ]

    assert AdventOfCode.IntCode.calculate_code([1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]) == [
             3500,
             9,
             10,
             70,
             2,
             3,
             11,
             0,
             99,
             30,
             40,
             50
           ]
  end
end
