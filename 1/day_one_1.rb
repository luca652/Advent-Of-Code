require_relative "day_one_2"

array = File.readlines('day_one_1_input.txt', chomp: true)

all_numbers = array.map do |string|
  one_to_1(string)
end

counter = 0

all_numbers.each do |array|

  counter += (array.first + array.last).to_i
end
p counter
