require './modules/Scrabbler'

class Scrabble
  def score(word)
    error_handler(word)
    score_checker(word)
  end

# deconstructs the word and checks each character against their respective score values
  def score_checker(word)
    word_score = ScrabbleNerd::LETTER_SCORE_VALUES
    points = 0
    word = word.to_s
    if word == nil || word.length == 0
      return points
    else
    single_characters = word.chars
      single_characters.each do |char|
        points += word_score[char.upcase]
      end
    end
    
    return points
  end
  
  # validator will pick up any illegal characters
  def validator(word)
    !word.match(/\A[a-zA-Z]*\z/).nil?
  end

# notify user that illegal characters were present in word
  def error_handler(word)
    if validator(word) == false
      return "Invalid: Word must not contain numbers or special characters"
    end
  end

end