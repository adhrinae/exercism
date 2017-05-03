class Crypto
  attr_reader :text
  def initialize(text)
    @text = text
    @columns = 0
    @rows = 0

    set_square_size(normalize_plaintext.length)
  end

  def normalize_plaintext
    text.downcase.scan(/([a-z]+|\d+)/).join
  end

  def size
    @columns
  end

  def plaintext_segments
    build_segments(normalize_plaintext, @columns)
  end

  def ciphertext
    (0...size).map do |index|
      plaintext_segments.inject('') do |cipher, segment|
        cipher += segment[index].to_s
      end
    end.join
  end

  def normalize_ciphertext
    if perfect_square?
      build_segments(ciphertext, @rows).join(' ')
    else
      size_of_rectangle = @rows * @columns
      empty_spaces = size_of_rectangle - ciphertext.length
      without_spaces = ciphertext.length - (@rows - 1) * empty_spaces
      
      chunks = build_segments(ciphertext[0...without_spaces], @rows) +
        build_segments(ciphertext[without_spaces..-1], @rows - 1)

      chunks.join(' ')
    end
  end

  private

  def set_square_size(text_length)
    @columns = Math.sqrt(text_length).ceil
    @rows = (text_length.to_f / @columns.to_f).ceil
  end

  def build_segments(text, size)
    text.chars.each_slice(size).map { |chunk| chunk.join }
  end

  def perfect_square?
    @columns == @rows
  end
end