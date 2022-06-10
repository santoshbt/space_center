defmodule SpaceCenter do
  @moduledoc false

  def fuel_required(mass, _directives) when mass <= 0, do: nil

  def fuel_required(mass, directives) when mass > 0 do
    Enum.map(directives, fn directive ->
      launch_gravity = if elem(directive, 0) == :launch, do: elem(directive, 1), else: 0
      land_gravity = if elem(directive, 0) == :land, do: elem(directive, 1), else: 0

      fuel_for_launch = if launch_gravity > 0, do:
                          round(mass * launch_gravity * 0.042 - 33), else: 0

      total_launch_fuel = if fuel_for_launch > 0, do:
        calculate_launch_fuel(fuel_for_launch, launch_gravity)

      fuel_for_land = if land_gravity > 0, do:
              round(mass * land_gravity * 0.033 - 42), else: 0

      total_land_fuel = if fuel_for_land > 0, do:
      calculate_land_fuel(fuel_for_land, land_gravity)

      if total_launch_fuel, do: total_launch_fuel, else: total_land_fuel
    end)
  end

  defp calculate_launch_fuel(fuel_for_launch, launch_gravity) do
    directive = {:launch, launch_gravity}
    gravity = elem(directive, 1)
    total_mass = round(fuel_for_launch * gravity * 0.042 - 33)
    additional_fuel = unless total_mass <= 0 do
      calculate_launch_fuel(total_mass, launch_gravity)
      fuel_for_launch + total_mass
    end
    additional_fuel
  end

  defp calculate_land_fuel(fuel_for_land, land_gravity) do
    directive = {:land, land_gravity}
    gravity = elem(directive, 1)
    total_mass = round(fuel_for_land * gravity * 0.033 - 42)
    additional_fuel = unless total_mass <= 0 do
      calculate_land_fuel(total_mass, land_gravity)
      fuel_for_land + total_mass
    end
    additional_fuel
  end
end
