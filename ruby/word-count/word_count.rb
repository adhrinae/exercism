class Phrase
  def initialize(sentence)
    @words = extract_words(sentence)
    @keywords = @words.uniq
  end

  def word_count
    @keywords.each_with_object({}) do |keyword, result|
      result[keyword] = @words.count(keyword)
    end
  end

  private

    def extract_words(sentence)
      sentence.downcase.gsub(/\s\'|\'\s/, ' ').scan(/[\w']+/)
    end
end

module BookKeeping
  VERSION = 1
end
