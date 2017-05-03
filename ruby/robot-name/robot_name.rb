require 'set'

class Robot
  attr_reader :name
  @@current_name = Set.new

  SERIAL_CODE_LIMITS = {
    letters: ('A'..'Z').to_a,
    digits:  ('0'..'9').to_a
  }.freeze

  def initialize
    @name = generate_serial
    verify_unique_name
    @@current_name << @name
  end

  def verify_unique_name
    reset if @@current_name.include?(@name)
  end

  def reset
    @@current_name.delete(@name)
    @name = generate_serial
    @@current_name << @name
  end

  private

    def generate_serial
      serial_letters = Array.new(2) { SERIAL_CODE_LIMITS[:letters].sample }.join
      serial_digits = Array.new(3) { SERIAL_CODE_LIMITS[:digits].sample }.join

      serial_letters << serial_digits
    end
end

module BookKeeping
  VERSION = 2
end
