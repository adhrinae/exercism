class PrimeFactors
  def self.for(number)
    result = []
    return result if number == 1

    factor = 2
    until number == 1
      if number % factor == 0
        result << factor
        number = number / factor
      else
        factor += 1
      end
    end

    result
  end
end
