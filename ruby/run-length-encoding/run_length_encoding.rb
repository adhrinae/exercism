class RunLengthEncoding
  def self.encode(input)
    # Replace the sequence of same characters to their counts + character
    input.gsub(/(\D)\1+/) do |match|
      match.length.to_s << match[-1]
    end
  end

  def self.decode(input)
    # Find characters right after digits and multiply characters by digits
    input.gsub(/\d+\D/) do |match|
      match[-1] * match[0...-1].to_i
    end
  end
end

module BookKeeping
  VERSION = 2
end
