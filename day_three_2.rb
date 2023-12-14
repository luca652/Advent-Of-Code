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



def find_gears(data)
  matches = []
  data.each do |string|
    string.enum_for(:scan, /\*/).map do |match, index|
      matches << [data.index(string), Regexp.last_match.begin(0)]
    end
  end
  matches
end



p matches
