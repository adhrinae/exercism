class Array
  def accumulate
    result = []
    max_index = self.size - 1
    index = 0

    until index > max_index
      result << yield(self[index])
      index += 1
    end

    result
  end
end
