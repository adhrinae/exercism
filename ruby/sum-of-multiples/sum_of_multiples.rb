class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(max_number)
    range_of_multiples = 0...max_number

    @numbers.map do |number|
      range_of_multiples.select { |multiple| multiple % number == 0 }
    end.flatten.uniq.inject(:+)
  end
end
