class Series
  def initialize(numbers)
    @numbers = numbers
  end

  def slices(digit)
    raise ArgumentError if digit > @numbers.length
    slice_range = 0..@numbers.length - digit

    slice_range.map do |n|
      @numbers[n, digit].chars.map { |char| char.to_i }
    end
  end
end
