array = File.readlines("day_two_input.txt", chomp: true)

strings = array.map do |string|
  string.split(": ")
end

strings.each { |array| array.shift}
strings = strings.flatten

strings = strings.map do |string|
  string.split("; ")
end


strings = strings.map do |array|
  array.map do |string|
    string.split(" ")
  end
end


strings.each do |array|
  array.each do |array|
    array.each do |string|
      string.delete!(",")
    end
  end
end


strings.each do |array|
  array.each do |array|
    array.reverse!
  end
end

strings = strings.map do |array|
  array.map do |array|
    array.each_slice(2).to_h
  end
end


# results = []
# strings = strings.map do |array|
#   min_values = {}
#   array.each do |hash|
#     hash.each do |key, value|
#       min_values[key] = min_values.key?(key) ? [min_values[key].to_i, value.to_i].min : value.to_i
#     end
#   end
#   results.push(min_values)
# end

results = []
strings = strings.map do |array|
  max_values = {}
  array.each do |hash|
    hash.each do |key, value|
      max_values[key] = [max_values[key].to_i, value.to_i].max
    end
  end
  results.push(max_values)
end

p results
counter = 0
results.each do |result|
 counter += (result["green"] * result["red"] * result["blue"])
end

p counter
