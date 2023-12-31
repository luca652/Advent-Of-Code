input = File.readlines('day_four_input.txt', chomp: true)


def score(matches)
  score = 0
  if matches > 0
    matches -= 1
    score += 1
    for n in 1..matches
      score *= 2
    end
  end
  score
end

def matching_numbers(card_numbers)
  points = []
  card_numbers.each_with_index do |element|
    matches = 0
    element[0].each do |number|
      if element[1].include?(number)
        matches += 1
      end
    end
    points << score(matches)
  end
  points.sum
end

def check_scratchcards(input)
  card_numbers = input.map do |string|
    winning_numbers = string.scan(/:(.*?)\|/).flatten.first.to_s.split.map(&:to_i)
    elf_numbers = string.scan(/\|(.*)/).flatten.first.to_s.split.map(&:to_i)
    [winning_numbers, elf_numbers]
  end
  card_numbers
end

card_numbers = check_scratchcards(input)
matches = matching_numbers(card_numbers)

p matches

# class Card
#   attr_reader :id, :winners, :numbers

#   def self.parse(line)
#     line.split(":")
#   end

#   def initialize(id, winners, numbers)
#     @id = id.to_i
#     @winners = winners
#     @numbers = numbers
#   end


# end
