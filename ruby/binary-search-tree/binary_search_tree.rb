class Bst
  VERSION = 1
  include Enumerable
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(value)
    if value <= data
      left.nil? ? self.left = Bst.new(value) : left.insert(value)
    elsif value > data
      right.nil? ? self.right = Bst.new(value) : right.insert(value)
    end
  end

  def each(&block)
    return enum_for(__method__) unless block_given?
    left.each(&block) if left
    block.call(self.data)
    right.each(&block) if right
  end
end
