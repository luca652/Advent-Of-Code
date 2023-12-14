input =
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

# input = File.readlines("day_three_input.txt", chomp: true)



def find_stars(input)
  stars = []
  input.each_with_index do |string, string_index|
    string.chars.each_with_index do |char, star_index|
      if char == "*"
        stars << [string_index, star_index]
      end
    end
  end
  stars
end

def check_same_string(input, star)

  star_string = star.first
  star_index = star.last
  string = input[star_string]

  matches = []

  if string[star_index - 1].match?(/\d/)
    before = string.chars.shift(star_index).reverse.join.match(/\d+/)
    matches << before[0]
  end

  if string[star_index + 1].match?(/\d/)
    after = string.chars.pop(star_index).join.match(/\d+/)
    matches << after[0]
  end
  matches
end

def check_previous_string(input, star)
  star_string = star.first
  star_index = star.last
  previous_string = input[star_string - 1]

  if previous_string
    matches = []
    match_area = [star_index - 1, star_index, star_index + 1]
    numbers_indices = previous_string.enum_for(:scan, /\d+/).map { Regexp.last_match.begin(0) }
    numbers = previous_string.scan(/\d+/)
    numbers_location = []
    numbers.each_with_index do |number, index|
      length = number.length
      start = numbers_indices[index]
      finish = numbers_indices[index + length - 1]
      numbers_location << ((start..finish).to_a)
    end

    numbers_location.each do |number|
      p number
    end

  end

end


stars = find_stars(input)

stars.each do |star|
  check_same_string(input, star)
  check_previous_string(input, star)
end
