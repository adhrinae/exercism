class Binary
  def initialize(binary_number)
    @binary = binary_number
    binary?
  end

  def to_decimal
    @binary.chars.reverse.map.with_index do |number, digit|
      binary_digit = 2**digit
      number.to_i * binary_digit
    end.inject(:+)
  end

  private

    def binary?
      raise ArgumentError unless @binary.chars.all? { |digit| digit == '0' || digit == '1' }
    end
end

module BookKeeping
  VERSION = 2
end
