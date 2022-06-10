Formula to calculate fuel is quite simple, but it depends on the planet's gravity. Planets NASA is interested in are:

Earth - 9.807 m/s2
Moon - 1.62 m/s2
Mars - 3.711 m/s2

The formula for fuel calculations for the launch is the following:

mass * gravity * 0.042 - 33 rounded down

The formula for fuel calculations for the landing is the following:

mass * gravity * 0.033 - 42 rounded down

Apollo 11:
path: launch Earth, land Moon, launch Moon, land Earth
weight of equipment: 28801 kg
weight of fuel: 51898 kg
arguments: 28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]
Mission on Mars:
path: launch Earth, land Mars, launch Mars, land Earth
weight of equipment: 14606 kg
weight of fuel: 33388 kg
arguments: 14606, [[:launch, 9.807], [:land, 3.711], [:launch, 3.711], [:land, 9.807]]
Passenger ship:
path: launch Earth, land Moon, launch Moon, land Mars, launch Mars, land Earth
weight of equipment: 75432 kg
weight of fuel: 212161 kg
arguments: 75432, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 3.711], [:launch, 3.711], [:land, 9.807]]
