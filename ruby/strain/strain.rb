module Enumerable
  def keep(&block)
    self.select { |element| yield(element) }
  end

  def discard(&block)
    self.reject { |element| yield(element) }
  end
end
