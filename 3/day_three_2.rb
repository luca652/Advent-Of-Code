require "set"

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

rows = input.map do |row|
  row
end

def find_stars(input)
  stars = []
  input.each_with_index do |string, string_index|
    string.each_char.with_index do |char, star_index|
      if char == "*"
        stars << [string_index, star_index]
      end
    end
  end
  stars
end

stars = find_stars(input)


gear_ratios = []
stars.each do |(x, y)|
  number_locations = []
	[
		[-1, -1],
		[-1, 0],
		[-1, 1],
		[0, -1],
		[0, 1],
		[1, -1],
		[1, 0],
		[1, 1]
	].each do |(dx, dy)|
		nx = x + dx
		ny = y + dy
		if rows[nx][ny] =~ /\d/
			number_locations << [nx, ny]
		end
	end

  number_starts = Set.new

  number_locations.each do |(x, y)|
    while rows[x][y - 1] =~ /\d/
      y -= 1
    end
    number_starts << [x, y]
  end

  if number_starts.count == 2
    result = number_starts.map do |(x, y)|
      rows[x][y..].to_i
    end.inject(:*)
    gear_ratios << result

  end
end

p gear_ratios.sum
