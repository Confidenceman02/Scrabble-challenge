require_relative '../lib/Scrabble'

describe 'Scrabble' do 
      # instantiate new Scrabble class with test variables
      game = Scrabble.new

      # test variables for validation
      test_valid_word = 'hello'
      test_with_numbers = 'hello12345'
      test_with_weirdass_characters = 'hello@&$#*%'
      test_with_empty_string = ""
      test_with_nil = nil

      # Test hash of words and associated valid scores 
      test_word_hash = {
        hooroo: 9,
        cabbage: 14,
        hire: 7,
        tennis: 6,
        truck: 11,
        abaxial: 16,
        anxiety: 17,
        coexists: 17,
        me: 4,
        please: 8
      }

      # Random picker of all test_word_hash keys
      test_word_01 = test_word_hash.keys.sample
      test_word_02 = test_word_hash.keys.sample
      test_word_03 = test_word_hash.keys.sample

      valid = true

  describe 'validator' do

    
    it 'Checks word being passed contains no numbers or special characters' do
      expect(game.validator(test_valid_word)).to be(valid)
      expect(game.validator(test_with_numbers)).not_to be(valid)
      expect(game.validator(test_with_weirdass_characters)).not_to be(valid)
    end
  end

  describe 'error_handler' do

    it 'returns a friendly error message if word is not valid' do
      error_message = "Invalid: Word must not contain numbers or special characters"
      expect(game.error_handler(test_with_numbers)).to eq(error_message)
      expect(game.error_handler(test_with_weirdass_characters)).to eq(error_message)
    end
  end

  describe 'score_checker' do

    it 'returns 0 if the word is an empty string or nil' do 
      expect(game.score_checker(test_with_empty_string)).to eq(0)
      expect(game.score_checker(test_with_nil)).to eq(0)
    end

    it 'returns correct value for given random valid word' do

      expect(game.score_checker(test_word_01)).to eq(test_word_hash[test_word_01])
      expect(game.score_checker(test_word_02)).to eq(test_word_hash[test_word_02])
      expect(game.score_checker(test_word_03)).to eq(test_word_hash[test_word_03])
    end
  end

  describe 'score' do

    it 'returns a valid score for a word not including extension package' do

      expect(game.score('please')).to eq(8)
      expect(game.score('hire')).to eq(7)
      expect(game.score('me')).to eq(4)
    end
  end
end