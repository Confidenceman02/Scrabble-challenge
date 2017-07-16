require_relative 'Scrabble'
require_relative 'Triple_double_game'
require 'tty'
require 'pry'

# to find out information about the letter position
def has_multiplier?(coordinate)
  letter_multiplier = ScrabbleNerd::LETTER_MULTIPLIER_VALUES
  word_multiplier = ScrabbleNerd::WORD_MULTIPLIER_VALUES
  multiplier_type = {}
  if letter_multiplier.has_key?(coordinate.to_sym)
    multiplier_type[:truth] = true
    multiplier_type[:type] = 'letter'
    multiplier_type[:value] = letter_multiplier[coordinate.to_sym]



    return multiplier_type
  elsif word_multiplier.has_key?(coordinate.to_sym)
    multiplier_type[:truth] = true
    multiplier_type[:type] = 'word'
    multiplier_type[:value] = word_multiplier[coordinate.to_sym]

    return multiplier_type
  else
    multiplier_type[:truth] = false
    return multiplier_type
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
      # stores the returned information about the grid position to run checks on
      is_multiplier = has_multiplier?(grid_position)

      if is_multiplier[:truth] && is_multiplier[:type] == 'letter'
        is_multiplier[:value] == 2 ? row << pastel.cyan(grid_position) : row << pastel.blue(grid_position)
      elsif
        is_multiplier[:truth] && is_multiplier[:type] == 'word'
          is_multiplier[:value] == 2 ? row << pastel.magenta(grid_position) : row << pastel.red(grid_position)
          # row << pastel.red(grid_position)
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


# Prompts the user for the game mode they wish to play
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
    puts game.score(input) # executes simple word score engine
    exit
end

pastel = Pastel.new
wordEx = pastel.yellow('word')
positionEx = pastel.yellow('POSITION')
directionEx = pastel.yellow('DIRECTION')

puts pastel.blue('Blue ') + '= Letter x3'
puts pastel.cyan("Cyan ") + '= Letter  x2'
puts pastel.red("Red ") + '= Word  x3'
puts pastel.magenta("Magenta ") + '= Word  x2'
puts ''

# Exemplifies the desired input 
puts "Please enter a " + wordEx + ", " + directionEx + " and a " + positionEx + " based on the scrabble grid above."
puts "For example: " + pastel.yellow('hooroo ') + pastel.yellow('ACROSS ') + pastel.yellow('A1')
input = gets.chomp
input_array = input.split(' ')

gameInfo = {
  word: input_array[0],
  grid_direction: input_array[1],
  first_letter_position: input_array[2]
}

game = Triple_double_game.new

# Initializes the game and returns correct score
puts game.score(gameInfo) 