defmodule SpaceCenter do
  @moduledoc false

  def fuel_required(mass, directives, fuel_weight \\ 0) when mass > 0 do
    Enum.map(directives, fn directive ->
      IO.inspect(directive)
      launch_gravity = if elem(directive, 0) == :launch, do: elem(directive, 1), else: 0
      land_gravity = if elem(directive, 0) == :land, do: elem(directive, 1), else: 0

      fuel_for_launch = if launch_gravity > 0, do:
                          round(mass * launch_gravity * 0.042 - 33), else: 0
      total_launch_fuel = if fuel_for_launch > 0 do
        additional_launch_fuel = fuel_for_launch + fuel_weight
        calculate_launch_fuel(fuel_for_launch, launch_gravity)
        additional_launch_fuel
      end

      fuel_for_land = if land_gravity > 0, do:
                      round(mass * land_gravity * 0.033 - 42), else: 0
      total_land_fuel = if fuel_for_land > 0 do
        additional_land_fuel = fuel_for_land + fuel_weight
        calculate_land_fuel(fuel_for_land, land_gravity)
        additional_land_fuel
      end

      if total_launch_fuel, do: total_launch_fuel, else: total_land_fuel
    end)
  end

  def fuel_required(mass) when mass <= 0, do: nil

  defp calculate_launch_fuel(fuel_for_launach, launch_gravity) do
    round(fuel_for_launach * launch_gravity * 0.042 - 33)
  end

  defp calculate_land_fuel(fuel_for_land, land_gravity) do
    round(fuel_for_land * land_gravity * 0.033 - 42)
  end
end
