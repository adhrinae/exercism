class Game
  class BowlingError < StandardError; end

  attr_reader :frames

  def initialize
    @frames = Array.new(10) { |i| Frame.new(i+1) }
  end

  def roll(pins)
    raise BowlingError if (pins < 0 || pins > 10) || !current_frame
    current_frame.throw(pins)
  end

  def score
    validate!

    result = 0

    (0..8).each do |index|
      next_throws = frames[index+1..-1].map do |frame|
        frame.throws
      end.flatten

      frame = frames[index]

      raise BowlingError unless frame.valid?

      if frames[index].spare?
        result += next_throws.first
      elsif frames[index].strike?
        result += next_throws.first(2).inject(:+)
      end

      result += frame.sum
    end

    result += final_frame_score
    result
  end

  private

  def current_frame
    frames.find { |frame| frame.working? }
  end

  def final_frame_score
    final_frame = frames.last
    raise BowlingError unless final_frame.valid_final?

    final_frame.sum
  end

  def validate!
    raise BowlingError unless completed?
  end

  def completed?
    frames.all? { |frame| frame.valid? || frame.valid_final? }
  end
end

class Frame
  attr_reader :throws, :order

  def initialize(order)
    @throws = []
    @order = order
  end

  def throw(pins)
    throws << pins
  end

  def sum
    throws.inject(:+)
  end

  def working?
    has_bonus? || (throws.length < 2 && !strike?)
  end

  def strike?
    throws.first == 10
  end

  def spare?
    throws.length >= 2 && throws.first(2).inject(:+) == 10
  end

  def valid?
    (!final? && strike?) ||
      (!final? && spare?) ||
        (!final? && throws.length == 2 && sum < 10)
  end

  def final?
    order == 10
  end

  def valid_final?
    if final? && strike? && throws.length == 3
      if (bonus_double_strike? && throws.last <= 10) ||
           (throws.last(2).inject(:+) <= 10)
         return true
      end
    elsif final? && spare? && throws.length == 3
      return true if throws.last <= 10
    elsif final? && throws.length == 2
      return true if sum < 10
    end

    false
  end

  def has_bonus?
    final? && (strike? || spare?)
  end

  def bonus_double_strike?
    has_bonus? && throws.first(2).all? { |throw| throw == 10 }
  end
end

module BookKeeping
  VERSION = 3
end
