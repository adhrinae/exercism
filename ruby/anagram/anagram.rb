class Anagram
  attr_reader :detector, :char_set

  def initialize(word)
    @detector = word
    @char_set = extract_chars(word)
  end

  def match(words)
    words.delete_if { |w| w.downcase == detector.downcase }
      .select do |word|
        char_set == extract_chars(word)
    end
  end

  private

  def extract_chars(word)
    result = {}

    word.downcase.each_char do |char|
      result[char] ||= 0
      result[char] += 1
    end

    result
  end
end

module BookKeeping
  VERSION = 2
end
