input = File.readlines('day_four_input.txt', chomp: true)

# input =
['Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53',
'Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19',
'Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1',
'Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83',
'Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36',
'Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11']

def score(all_matches)
  total_score = []
  all_matches.each do |match|
    score = 0
    if match > 0
      match -= 1
      score += 1
      for n in 1..match
        score *= 2
      end
    end
    total_score << score
  end
  total_score.sum
end

def matching_numbers(card_numbers)
  all_matches = []
  card_numbers.each_with_index do |element|
    matches = 0
    element[0].each do |number|
      if element[1].include?(number)
        matches += 1
      end
    end
    all_matches << matches
  end
  all_matches
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
all_matches = matching_numbers(card_numbers)
total_score = score(all_matches)
total_score

# creating hash to keep track of the number of cards and adding each card with initial value of 1
cards = {}

card_numbers.each_with_index do |card, index|
  cards[index] = 1
end


# iterating over the matches, and adding cards to the hash
# the index of the match is equal to the index of the card the match belongs to, so iterating over the matches is the same as iterating over the cards
# for each card, we add a card or cards (1 * the number of that specific card we have) to the following cards up to index + match
all_matches.each_with_index do |match, index|
  for n in 1..match
    cards[index + n] += (1 * (cards[index]))
  end

end

total_cards = 0
cards.each_value do |value|
  total_cards += value
end
