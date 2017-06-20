require './modules/Scrabbler'
require 'pry'

module Triple_double_game
  def multi_word_processor(word_options = {})
    word_options.length == 3
  end

  # letters must be assigned a valid scrabble grid position to score correctly
  def letter_position_assigner(word_options)
    letter_score = ScrabbleNerd::LETTER_SCORE_VALUES
    letter_positions = []
    start_position = word_options[:first_letter_position].split('', 2) # splits into x/y axis
    word_letters = word_options[:word].chars # Break word into indivudiual characters
    pointer = 0

    word_options[:grid_direction] == 'down' ? pointer = 1 : nil
    word_letters.each do |letter|
      position_data = [letter, start_position.join, letter_score[letter.upcase]]
      apply_multiplier(position_data)
      letter_positions << position_data
      start_position[pointer] = start_position[pointer].succ
    end
    return letter_positions
  end
  
  # multipliers will be added to letter positions which correspond to letter multipliers
  def apply_multiplier(position_array)
    letter_multiplier = ScrabbleNerd::LETTER_SCORE_POSITION_MULTIPLIER
    if letter_multiplier.has_key?(position_array[1].to_sym) # constant keys are all symbols
      position_array[2] *= letter_multiplier[position_array[1].to_sym]
      return position_array
    else
      return position_array
    end
  end
end
