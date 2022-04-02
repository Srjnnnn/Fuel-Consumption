def fuel_consumption(ship_mass, launching_directions, result = [], additional_fuel = 0)
  launch_constant = 0.042
  land_constant = 0.033
  current_mass = ship_mass

  launching_directions.each do |item|
    while additional_fuel >= 0
      additional_fuel = if item[0] == :launch
                          ((current_mass * launch_constant * item[1]) - 33).floor(0)
                        else
                          ((current_mass * land_constant * item[1]) - 42).floor(0)
                        end
      current_mass = additional_fuel
      ship_mass += additional_fuel
      result.push(additional_fuel) if additional_fuel.positive?
    end
  end
  fuel_consumption(ship_mass, launching_directions.slice(1..-1), result) if launching_directions.length > 1
  result.inject(&:+)
end

# Iterate through the launching directions and put a while loop inside the loop
## inside while loop make the calculation and decrease the number till it gets zero
## calculate the additional fuel and add it to the result
## return result
## call the method for the other item

p fuel_consumption(28_801, [[:land, 9.807]])

## 13447

p fuel_consumption(28_801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]])

## 51899

p fuel_consumption(14_606, [[:launch, 9.807], [:land, 3.711], [:launch, 3.711], [:land, 9.807]])

## 33441

p fuel_consumption(75_432,
                   [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 3.711], [:launch, 3.711], [:land, 9.807]])

## 212155
