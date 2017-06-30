require_relative 'Scrabble'
require 'tty'
require 'pry'



def table_builder
  yAxis = (1..15).to_a
  xAxis = ('A'..'G').to_a
  grid = []
  selector = 0
  yAxis.each do |y|
  row = []
    while selector != 7
      row << xAxis[selector] + y.to_s
      selector += 1
    end
    grid << row
    row = []
    selector = 0
  end
  puts TTY::Table.new grid

end

prompt = TTY::Prompt.new
choice01 = "Score word"
choice02 = "Score word with scrabble grid multipliers"
decision = prompt.select("Choose game mode", choice01, choice02)
system('clear')

case decision
  when "Score word with scrabble grid multipliers"
    pastel = Pastel.new
    wordEx = pastel.yellow('word')
    positionEx = pastel.yellow('posiiton')
    directionEx = pastel.yellow('direction')
    table_builder
    puts "Please enter a " + wordEx + ", " + positionEx + " and a " + directionEx + " based on the scrabble grid above."
    sleep(3)
    puts "For example: " + pastel.yellow('hooroo ') + pastel.yellow('A1 ') + pastel.yellow('ACROSS')
    input = gets.chomp
  else
    puts "Please enter word to be scored"
    input = gets.chomp
    game = Scrabble.new 
    puts game.score(input)
end

  