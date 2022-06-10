defmodule SpaceCenterTest do
  use ExUnit.Case
  doctest SpaceCenter

  test "check the space craft programs" do
    apollo_mass = 28801
    apollo_directives = [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}]

    mars_mass = 14606
    mars_directives = [{:launch, 9.807}, {:land, 3.711}, {:launch, 3.711}, {:land, 9.807}]

    pass_ship_mass = 75432
    ship_directives = [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 3.711}, {:launch, 3.711}, {:land, 9.807}]

    fuel_for_apollo = SpaceCenter.fuel_required(apollo_mass, apollo_directives)
    assert fuel_for_apollo == [11830, 1498, 1927, 9279]

    fuel_for_mars = SpaceCenter.fuel_required(mars_mass, mars_directives)
    assert fuel_for_mars == [5983, 1747, 2244, 4685]

    fuel_for_pass_ship = SpaceCenter.fuel_required(pass_ship_mass, ship_directives)
    assert fuel_for_pass_ship == [31037, 3991, 5099, 9196, 11724, 24370]
  end
end
