defmodule SpaceCenterTest do
  use ExUnit.Case
  doctest SpaceCenter

  test "check the space craft programs" do
    apollo_mass = 28801
    apollo_directives = [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}]
    fuel_for_apollo = SpaceCenter.fuel_required(apollo_mass, apollo_directives)
    assert fuel_for_apollo == [16670, 1536, 2025, 12240]

    mars_mass = 14606
    mars_directives = [{:launch, 9.807}, {:land, 3.711}, {:launch, 3.711}, {:land, 9.807}]
    fuel_for_mars = SpaceCenter.fuel_required(mars_mass, mars_directives)
    assert fuel_for_mars == [8414, 1919, 2561, 6159]

    pass_ship_mass = 75432
    ship_directives = [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 3.711}, {:launch, 3.711}, {:land, 9.807}]
    fuel_for_pass_ship = SpaceCenter.fuel_required(pass_ship_mass, ship_directives)
    assert fuel_for_pass_ship == [43788, 4162, 5413, 10280, 13518, 32215]
  end
end
