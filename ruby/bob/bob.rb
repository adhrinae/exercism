class Bob
  RESPONSE = {
    yelling: 'Whoa, chill out!',
    asking: 'Sure.',
    silence: 'Fine. Be that way!',
    statement: 'Whatever.'
  }.freeze

  Yelling = ->(sentence) { sentence == sentence.upcase && sentence =~ /[A-Z]/ }
  Asking  = ->(sentence) { sentence.end_with?("?") }
  Silence = ->(sentence) { sentence.strip.empty? }

  def hey(sentence)
    RESPONSE[answer(sentence)]
  end

  private

    def answer(sentence)
      case sentence
      when Yelling
        :yelling
      when Asking
        :asking
      when Silence
        :silence
      else
        :statement
      end
    end
end
