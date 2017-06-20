require 'Triple_double_game'

describe 'Triple_double_scores' do
  # extended class
  let(:game) {Class.new { extend Triple_double_game } }

  valid = true

  describe 'multi_word_processor' do

    valid_triple_double_input_across = {
      first_letter_position: 'G3',
      grid_direction: 'across', # 'accross' or 'down' valid
      word: 'hooroo'
    }

    valid_triple_double_input_down = {
      first_letter_position: 'G3',
      grid_direction: 'down', # 'accross' or 'down' valid
      word: 'hooroo'
    }

    valid_triple_double_input_down_double_digits = {
      first_letter_position: 'G8',
      grid_direction: 'down', # 'accross' or 'down' valid
      word: 'hooroo'
    }

    it 'validates the object passed returns invalid if object has anything other than three values' do

      invalid_options_count_01 = {
        starting_letter_positionn: 'G3',
        direction: 'across', # 'accross' or 'down' valid
      }

      invalid_options_count_02 = {
        starting_letter_positionn: 'G3',
        direction: 'across', # 'accross' or 'down' valid,
        word: 'winning words',
        extra_options: 'winner'
      }

        expect(game.multi_word_processor(invalid_options_count_01)).not_to be(valid)
        expect(game.multi_word_processor(invalid_options_count_02)).not_to be(valid)
    end

    it 'returns hash with grid position and letter score for every character in word when direction value is equal to across' do

      expect(game.letter_position_assigner(valid_triple_double_input_across)).to eq([
        ['h', 'G3', 8], ['o', 'H3', 1], ['o', 'I3', 2], ['r', 'J3', 1], ['o', 'K3', 1], ['o', 'L3', 1]
      ])
      expect(game.letter_position_assigner(valid_triple_double_input_down)).to eq([
        ['h', 'G3', 8], ['o', 'G4', 1], ['o', 'G5', 1], ['r', 'G6', 1], ['o', 'G7', 2], ['o', 'G8', 1]
      ])
      expect(game.letter_position_assigner(valid_triple_double_input_down_double_digits)).to eq([
        ['h', 'G8', 4], ['o', 'G9', 2], ['o', 'G10', 1], ['r', 'G11', 1], ['o', 'G12', 1], ['o', 'G13', 2]
      ])

    end
  end
end
