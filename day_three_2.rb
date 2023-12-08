DATA =
[
"467..114..",
"...*......",
"..35..633.",
"......#...",
"617*......",
".....+.58.",
"..592.....",
"......755.",
"...$.*....",
".664.598.."]

# File.readlines("day_three_input.txt", chomp: true)

def check_previous_string(string_number, index)
  gears = []

  return gears if string_number.zero?

  previous_string = DATA[string_number - 1]
  return gears unless previous_string

  adjacent_snippet = previous_string[index - 1..index + 1]
  adjacent_digits = adjacent_snippet.scan(/\d+/).flatten

  gears.concat(adjacent_digits)
end

matches = find_gears(DATA)
p gears = matches.flat_map { |string_number, index| check_previous_string(string_number, index) }


# def find_gears(data)
#   matches = []
#   data.each do |string|
#     string.enum_for(:scan, /\*/).map do |match, index|
#       matches << [data.index(string), Regexp.last_match.begin(0)]
#     end
#   end
#   matches
# end

# matches = find_gears(DATA)

# def check_previous_string(string_number, index)
#   gears = []

#   unless string_number == 0
#     previous_string = DATA[string_number - 1]

#     if previous_string[index].match?(/\d/)
#       start_index = [index - 2, 0].max
#       end_index = [index + 2, previous_string.length - 1].min
#       snippet = previous_string[start_index..end_index]
#       match = snippet.match(/\d+/)
#       gears.push(match[0]) unless match.nil?

#     elsif !previous_string[index].match?(/\d/)
#       start_index = [index - 3, 0].max
#       end_index = [index + 3, previous_string.length - 1].min
#       snippet = previous_string[start_index..end_index]

#       first_half = snippet[0..2]
#       second_half = snippet[4..6]

#       if first_half[2].match?(/\d/) && !first_half[1].match?(/\d/)
#         match = first_half[2].match(/\d/)
#         gears.push(match[0])
#       elsif first_half[2].match?(/\d/) && first_half[1].match?(/\d/) && !first_half[0].match?(/\d/)
#         match = first_half[1..2].match(/\d+/)
#         gears.push(match[0])
#       elsif first_half[2].match?(/\d/) && first_half[1].match?(/\d/) && first_half[0].match?(/\d/)
#         p "index: #{index}"
#         match = first_half.match(/\d+/)
#       end

#       if second_half[0].match?(/\d/) && !second_half[1].match?(/\d/)
#         match = second_half.first(/\d/)
#         gears.push(match[0])
#       elsif second_half[0].match?(/\d/) && second_half[1].match?(/\d/) && !second_half[2].match?(/\d/)
#         match = second_half[0..1].match(/\d+/)
#         gears.push(match[0])
#       else second_half[0].match?(/\d/) && second_half[1].match?(/\d/) && second_half[2].match?(/\d/)
#         match = second_half.match(/\d+/)
#       end

#     end
#   end
#   gears.flatten
# end



# def check_next_string(string_number, index)
#   gears = []

#   unless string_number == DATA.length - 1
#     next_string = DATA[string_number + 1]

#     if next_string[index].match?(/\d/)
#       start_index = [index - 2, 0].max
#       end_index = [index + 2, next_string.length - 1].min
#       snippet = next_string[start_index..end_index]
#       match = snippet.match(/\d+/)
#       gears.push(match[0]) unless match.nil?
#     elsif !next_string[index].match?(/\d/)
#       start_index = [index - 3, 0].max
#       end_index = [index + 3, next_string.length - 1].min
#       snippet = next_string[start_index..end_index]

#       first_half = snippet[0..2]
#       second_half = snippet[4..6]

#       if first_half[2].match?(/\d/) && !first_half[1].match?(/\d/)
#         match = first_half[2].match(/\d/)
#         gears.push(match[0])
#       elsif first_half[2].match?(/\d/) && first_half[1].match?(/\d/) && !first_half[0].match?(/\d/)
#         match = first_half[1..2].match(/\d+/)
#         gears.push(match[0])
#       elsif first_half[2].match?(/\d/) && first_half[1].match?(/\d/) && first_half[0].match?(/\d/)
#         p "index: #{index}"
#         match = first_half.match(/\d+/)
#       end

#       if second_half[0].match?(/\d/) && !second_half[1].match?(/\d/)
#         match = second_half.first(/\d/)
#         gears.push(match[0])
#       elsif second_half[0].match?(/\d/) && second_half[1].match?(/\d/) && !second_half[2].match?(/\d/)
#         match = second_half[0..1].match(/\d+/)
#         gears.push(match[0])
#       else second_half[0].match?(/\d/) && second_half[1].match?(/\d/) && second_half[2].match?(/\d/)
#         match = second_half.match(/\d+/)
#       end

#     end
#   end
#   p gears.flatten
# end

# # super_gears = []
# matches.each do |string_number, index|
#   previous_numbers = check_previous_string(string_number, index)
#   next_numbers = check_next_string(string_number, index)
# #   same_string_numbers = check_same_string(string_number, index)

# #   total = previous_numbers + next_numbers + same_string_numbers
# #   if total.count == 2
# #     super_gears << total
# #   end
# end

# # gear_ratios = []
# # super_gears.each do |gear|
# #   gear_ratios << (gear.first.to_i * gear.last.to_i)
# # end

# # p gear_ratios.sum








#       # previous_string = data[string_number - 1]
#       # if previous_string[index - 1].digit? && previous_string[index + 1].digit? && previous_string[index + 1].digit?
#       #   counter = counter + 1
#       # end
