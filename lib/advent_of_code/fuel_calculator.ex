defmodule AdventOfCode.FuelCalculator do
  """
   Fuel required to launch a given module is based on its mass. Specifically, to find the fuel required for a module, take its mass, divide by three, round down, and subtract 2.

   For example:
   For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2.
   For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2.
   For a mass of 1969, the fuel required is 654.
   For a mass of 100756, the fuel required is 33583.
  """

  def calculate_fuel(mass_list) when is_list(mass_list) do
    Enum.reduce(mass_list, 0, fn mass, total_fuel_needs ->
      total_fuel_needs + calculate_fuel(mass)
    end)
  end

  def calculate_fuel(mass) do
    fuel = (mass / 3) |> floor()
    fuel = fuel - 2
    calculate_fuel(fuel, fuel)
  end

  defp calculate_fuel(mass, total_fuel_needs) when mass <= 0 do
    0
  end

  defp calculate_fuel(mass, total_fuel_needs) do
    total_fuel_needs + calculate_fuel(mass)
  end
end
