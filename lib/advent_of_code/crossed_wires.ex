defmodule AdventOfCode.CrossedWires do
  def calculate_nearest_intersection(path_1, path_2) do
    {path_1, path_2}
    |> coords_for_paths()
    |> calculate_coord_intersections()
    |> calculate_coord_with_minimum_manhattan_distance()
    |> calculate_manhattan_distance()
  end

  def calculate_shortest_distance_to_intersection(path_1, path_2) do
    {coords_1, coords_2} = {path_1, path_2} |> coords_for_paths()

    {coords_1, coords_2}
    |> calculate_coord_intersections()
    |> Enum.map(fn point ->
      path_1_steps = Enum.find_index(coords_1, fn coord -> point == coord end) + 1
      path_2_steps = Enum.find_index(coords_2, fn coord -> point == coord end) + 1
      path_1_steps + path_2_steps
    end)
    |> Enum.min()
  end

  def coords_for_paths({path_1, path_2}) do
    {
      coords_for_path(path_1),
      coords_for_path(path_2)
    }
  end

  def coords_for_path(path) when is_list(path) do
    {coords, _} =
      Enum.reduce(path, {[], {0, 0}}, fn direction_string, {total_points, current_pos} ->
        points = coords_for_path(current_pos, direction_string)
        [current_pos | _] = points

        {
          [points | total_points],
          current_pos
        }
      end)

    coords |> List.flatten() |> Enum.reverse()
  end

  def coords_for_path({x, y}, direction_string) do
    case direction_string do
      "U" <> distance ->
        distance = String.to_integer(distance)

        for current_y <- (y + 1)..(y + distance) do
          {x, current_y}
        end

      "D" <> distance ->
        distance = String.to_integer(distance)

        for current_y <- (y - 1)..(y - distance) do
          {x, current_y}
        end

      "L" <> distance ->
        distance = String.to_integer(distance)

        for current_x <- (x - 1)..(x - distance) do
          {current_x, y}
        end

      "R" <> distance ->
        distance = String.to_integer(distance)

        for current_x <- (x + 1)..(x + distance) do
          {current_x, y}
        end
    end
    |> Enum.reverse()
  end

  def calculate_coord_intersections({coords_1, coords_2}) do
    MapSet.intersection(MapSet.new(coords_1), MapSet.new(coords_2))
  end

  def calculate_coord_with_minimum_manhattan_distance(coords) do
    Enum.min_by(coords, &calculate_manhattan_distance/1)
  end

  def calculate_manhattan_distance({x, y}) do
    abs(x) + abs(y)
  end
end
