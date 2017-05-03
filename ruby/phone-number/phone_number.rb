class PhoneNumber
  def initialize(phone_number)
    @numbers = init_number(phone_number)
  end

  def number
    return bad_number unless valid_number?
    print_number
  end

  def area_code
    print_number[0, 3] if valid_number?
  end

  def to_s
    if valid_number?
      area_code = print_number[0, 3]
      prefix = print_number[3, 3]
      last = print_number[6, 4]

      "(#{area_code}) #{prefix}-#{last}"
    end
  end

  private

  def init_number(phone_number)
    phone_number.gsub(/\W/, '')
  end

  def valid_number?
    ten_digits? || eleven_digits_with_first_1?
  end

  def print_number
    eleven_digits_with_first_1? ? @numbers[1..-1] : @numbers
  end

  def bad_number
    '0' * 10
  end

  def ten_digits?
    @numbers =~ /^\d{10}$/
  end

  def eleven_digits_with_first_1?
    @numbers =~ /^1\d{10}$/
  end
end
