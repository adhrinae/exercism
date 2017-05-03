class Sieve
  attr_reader :candidates

  def initialize(number)
    first_prime = 2
    @candidates = (first_prime..number).to_a
  end

  def primes
    result = []

    until candidates.empty?
      result << candidates.shift
      candidates.delete_if { |e| e % result[-1] == 0 }
      candidates
    end

    result
  end
end
