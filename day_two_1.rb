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

pp results
counter = 0
results.each_with_index do |hash, index|
  if hash["red"] <= 12 && hash["green"] <= 13 && hash["blue"] <= 14
    counter += (index + 1)
  end
end
p counter
