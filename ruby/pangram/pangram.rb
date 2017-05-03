module BookKeeping
  VERSION = 2
end

class Pangram
  ALPHABET = 'a'..'z'

  def self.is_pangram?(sentence)
    given_sentence = sentence.downcase.chars

    ALPHABET.all? { |char| given_sentence.include?(char) }
  end
end
