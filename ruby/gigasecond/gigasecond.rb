module BookKeeping
  VERSION = 4
end

class Gigasecond
  GIGASECOND = 10**9

  def self.from(seconds)
    seconds + GIGASECOND
  end
end
