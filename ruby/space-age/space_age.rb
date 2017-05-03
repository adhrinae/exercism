class SpaceAge
  attr_reader :seconds

  EARTH_YEAR_TO_SECONDS   = 31_557_600.to_f
  MERCURY_YEAR_FROM_EARTH = 0.2_408_467.to_f
  VENUS_YEAR_FROM_EARTH   = 0.61_519_726.to_f
  MARS_YEAR_FROM_EARTH    = 1.8_808_158.to_f
  JUPITER_YEAR_FROM_EARTH = 11.862_615.to_f
  SATURN_YEAR_FROM_EARTH  = 29.447_498.to_f
  URANUS_YEAR_FROM_EARTH  = 84.016_846.to_f
  NEPTUNE_YEAR_FROM_EARTH = 164.79_132.to_f

  def initialize(seconds)
    @seconds = seconds.to_f
  end

  def on_earth
    (seconds / EARTH_YEAR_TO_SECONDS).round(2)
  end

  def method_missing(method_sym, *args, &blk)
    value = find_value(method_sym)

    if value
      (on_earth / value).round(2)
    else
      super
    end
  end

  private

  def find_value(method_sym)
    constants = self.class.constants
    meth = method_sym.to_s.gsub(/^on_/, '').upcase

    constants.grep(Regexp.new(/^#{meth}/)) { |const| self.class.const_get(const) }.first
  end
end
