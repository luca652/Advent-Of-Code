# CARDS = File.readlines('day_four_input.txt', chomp: true)

CARDS = [
"Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53",
"Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19",
"Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1",
"Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83",
"Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36",
"Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"]

p CARDS.count
count = 0
def copy_cards(matches, index)
  copies = []
  until matches == 0
      range = (1..matches).to_a
      range.each do |n|
        p "number: #{n}"
        p "index: #{index}"
        p "matches: #{matches}"
        p "cards #{CARDS[index + n]}"
        p "index_insert: #{n}"
        copies.insert(0, CARDS[index + n])
      end
    end
    p copies
end

def matching_numbers(winning_numbers, elf_numbers, index)
  matches = 0
  winning_numbers.each do |number|
    if elf_numbers.include?(number)
      matches += 1
    end

  end
  copy_cards(matches, index)

end

def check_scratchcards(cards)
  cards.each_with_index do |string, index|
    winning_numbers = string.scan(/:(.*?)\|/).flatten.first.to_s.split.map(&:to_i)
    elf_numbers = string.scan(/\|(.*)/).flatten.first.to_s.split.map(&:to_i)
    matching_numbers(winning_numbers, elf_numbers, index)
  end
end

check_scratchcards(CARDS)
p CARDS.count
