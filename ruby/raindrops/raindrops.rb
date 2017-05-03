module BookKeeping
  VERSION = 3
end

class Raindrops
  RAINDROPS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }

  def self.convert(number)
    result = RAINDROPS.keys.inject('') do |result, factor|
      result << RAINDROPS[factor] if number % factor == 0
      result
    end

    result.empty? ? number.to_s : result
  end
end
