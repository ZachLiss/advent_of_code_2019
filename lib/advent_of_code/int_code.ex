defmodule AdventOfCode.IntCode do
  def calculate_code(int_code) do
    calculate_code(int_code, 0)
  end

  def calculate_code(int_code, pos) do
    case int_code
         |> Enum.slice(pos..(pos + 3))
         |> process_int_code(int_code) do
      {:ok, new_code} -> calculate_code(new_code, pos + 4)
      {:halt, new_code} -> new_code
    end
  end

  defp process_int_code([99 | _tail], int_code) do
    {:halt, int_code}
  end

  defp process_int_code([opp, pos1, pos2, targetIndex], int_code) do
    case opp do
      # add
      1 ->
        {:ok,
         List.replace_at(
           int_code,
           targetIndex,
           Enum.fetch!(int_code, pos1) + Enum.fetch!(int_code, pos2)
         )}

      # multiply
      2 ->
        {:ok,
         List.replace_at(
           int_code,
           targetIndex,
           Enum.fetch!(int_code, pos1) * Enum.fetch!(int_code, pos2)
         )}

      _ ->
        :error
    end
  end
end
