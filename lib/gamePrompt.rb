require_relative 'Scrabble'
require 'tty'
require 'pry'

def has_multiplier?(coordinate, multiplier_type = {})
  letter_multiplier = ScrabbleNerd::LETTER_MULTIPLIER_VALUES
  word_multiplier = ScrabbleNerd::WORD_MULTIPLIER_VALUES

  if multiplier_type[:type] == 'letter' 
    return letter_multiplier.has_key?(coordinate.to_sym)
  else multiplier_type[:type] == 'word' 
    return word_multiplier.has_key?(coordinate.to_sym)
  end
end

def table_builder
  yAxis = (1..15).to_a
  xAxis = ('A'..'O').to_a
  grid = []
  selector = 0
  yAxis.each do |y|
  row = []
    while selector != 15
      pastel = Pastel.new
      grid_position = xAxis[selector] + y.to_s
      if has_multiplier?(grid_position, { type: 'letter' })
        row << pastel.yellow(grid_position)
      elsif
        has_multiplier?(grid_position, { type: 'word' })
        row << pastel.red(grid_position)
      else
        row << grid_position
      end
      selector += 1
    end
    grid << row
    row = []
    selector = 0
  end
  puts TTY::Table.new grid # construct grid with all grid rows
  puts "" # readability
end

prompt = TTY::Prompt.new
choice01 = "Score word"
choice02 = "Score word with scrabble grid multipliers"
decision = prompt.select("Choose game mode", choice01, choice02)
system('clear')


case decision
  when "Score word with scrabble grid multipliers"
    table_builder
  else
    puts "Please enter word to be scored"
    input = gets.chomp
    game = Scrabble.new 
    puts game.score(input)
end

pastel = Pastel.new
wordEx = pastel.yellow('word')
positionEx = pastel.yellow('POSITION')
directionEx = pastel.yellow('DIRECTION')

puts pastel.yellow('Yellow ') + '= Letter multiplier'
puts pastel.red("Red ") + '= Word multiplier'
puts ''
puts "Please enter a " + wordEx + ", " + positionEx + " and a " + directionEx + " based on the scrabble grid above."
sleep(3)
puts "For example: " + pastel.yellow('hooroo ') + pastel.yellow('A1 ') + pastel.yellow('ACROSS')
input = gets.chomp

