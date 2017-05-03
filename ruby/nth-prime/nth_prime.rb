module BookKeeping
  VERSION = 1
end

class Prime
  FIRST_PRIME = 2

  class << self
    def nth(order)
      fail ArgumentError if order < 1

      range = FIRST_PRIME..Float::INFINITY
      primes = range.lazy.select do |num|
        prime?(num)
      end.first(order)

      primes.last
    end

    private

      def prime?(number)
        (FIRST_PRIME..Math.sqrt(number).to_i).all? do |e|
          number % e != 0
        end
      end
  end
end
