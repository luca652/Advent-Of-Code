data = File.readlines("day_three_input.txt", chomp: true)


# data = []
# input.each_with_index do |string, index|
#   data.push(string) if index > 120 && index < 140
# end


#  data =
["467..114..",
"...*......",
"..35..633.",
"......#...",
"617*......",
".....+.58.",
"..592.....",
"......755.",
"...$.*....",
".664.598.."]

SYMBOLS = /[^A-Za-z0-9.]/


results = []


def same_string_check_after(data, results)
  numbers = []
  data.each do |string|
    matches = string.scan(/\d+#{SYMBOLS}/)
    matches.each do |match|
      number = match.match(/\d+/).to_s

      match_start = string.index(match)
      string[match_start, number.length] = "." * number.length
      numbers.push(number)
    end
  end
  p "after:#{numbers}"
  results.push(numbers)
end

def same_string_check_before(data, results)
  numbers = []
  data.each do |string|
    matches = string.scan(/#{SYMBOLS}\d+/)
    matches.each do |match|
      number = match.match(/\d+/).to_s
      match_start = (string.index(match) + 1)
      string[match_start, number.length] = "." * number.length
      numbers.push(number)
    end
  end
  p "before:#{numbers}"
  results.push(numbers)
end

def next_string_check(data, results)
  numbers = []
  data.each_with_index do |string, index|
    unless index == data.length - 1

      matches = string.enum_for(:scan, /\d+/).map do |match, index|
        [match, Regexp.last_match.begin(0)]
      end

      next_string = data[index + 1]
      matches.each do |match, index|

        if (index + match.length) > string.length - 1
          range = (index - 1)..(string.length - 1)
        elsif index == 0
          range = (index)..(index + match.length)
        else
          range = (index - 1)..(index + match.length)
        end

        for n in range
          if next_string[n].match?(/#{SYMBOLS}/)
            numbers.push(match)
            string[index, match.length] = "." * match.length
          end
        end
      end
    end
  end
  results.push(numbers)
end



def previous_string_check(data, results)
  numbers = []
  data.each_with_index do |string, index|
    unless index == 0

      matches = string.enum_for(:scan, /\d+/).map do |match, index|
        [match, Regexp.last_match.begin(0)]
      end

      previous_string = data[index - 1]

      matches.each do |match, index|

        if (index + match.length) > string.length - 1
          range = (index - 1)..(string.length - 1)
        elsif index == 0
          range = (index)..(index + match.length)
        else
          range = (index - 1)..(index + match.length)
        end

        for n in range
          if previous_string[n].match?(/#{SYMBOLS}/)
            numbers.push(match)
            string[index, match.length] = "." * match.length
          end
        end
      end
    end
  end
  results.push(numbers)
end


same_string_check_after(data, results)
same_string_check_before(data, results)
next_string_check(data, results)
previous_string_check(data, results)






results.flatten
p results = results.flatten.map {|result| result.to_i}.sum
