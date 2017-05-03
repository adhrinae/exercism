class Trinary
  def initialize(number)
    @number = number
  end

  def to_decimal
    trinary?(@number) ? convert_trinary : 0
  end

  private

  def trinary?(number)
    number.chars.all? { |digit| ('0'..'3').to_a.include?(digit) }
  end

  def convert_trinary
    @number.chars.reverse.map.with_index do |number, digit|
      trinary_digit = 3**digit
      number.to_i * trinary_digit
    end.reduce(:+)
  end
end

module BookKeeping
  VERSION = 1
end

