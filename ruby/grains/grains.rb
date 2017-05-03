class Grains
  SQUARES_ON_CHESSBOARD = 64

  def self.square(nth_square)
    return 1 if nth_square == 1
    2 * square(nth_square - 1)
  end

  def self.total
    (1..SQUARES_IN_CHESSBOARD).inject do |total, nth_square|
      total + self.square(nth_square)
    end
  end
end
