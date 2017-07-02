require_relative '../modules/Scrabbler'
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

    word_options[:grid_direction] == 'down' ? pointer = 1 : nil # selects whether to increment x/y axis based on direction
    word_letters.each do |letter|
      position_data = [letter, start_position.join, letter_score[letter.upcase]]
      apply_letter_multiplier(position_data)
      
      letter_positions << position_data
      start_position[pointer] = start_position[pointer].succ
    end
    return letter_positions
  end
  
  # valid letter multipliers will be added to position array
  def apply_letter_multiplier(position_array)
    letter_multiplier = ScrabbleNerd::LETTER_MULTIPLIER_VALUES
    if letter_multiplier.has_key?(position_array[1].to_sym) # constant keys are all symbols
      position_array[2] *= letter_multiplier[position_array[1].to_sym] # multiplying letter score by valid multiplier
      return position_array
    else
      return position_array
    end
  end

  # To check if any letter lands on word multiplier, the multiplier value will be added to the position array
  def summerizer(position_array)
    multiplier = []
    multiplier_matches = []
    word_multiplier = ScrabbleNerd::WORD_MULTIPLIER_VALUES
    final_score = position_array.each.sum {|number| number[2]} # letter scores summed to then apply word multiplier as per scrabble rules

    position_array.each do |position|
      if word_multiplier.has_key?(position[1].to_sym) 
        multiplier_matches << word_multiplier[position[1].to_sym]
      end
    end
# will apply any word multipliers if letter has landed on any word multiplier tiles
    if multiplier_matches.count == 0
      return final_score
    else
      multiplier_matches.each {|s| final_score *= s }
    end
    return final_score
  end
end