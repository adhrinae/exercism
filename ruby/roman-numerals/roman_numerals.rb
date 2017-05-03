module BookKeeping
  VERSION = 2
end

class Fixnum
  ROMAN_FACTORS = {
    "M"  => 1000,
    "CM" =>  900,
    "D"  =>  500,
    "CD" =>  400,
    "C"  =>  100,
    "XC" =>   90,
    "L"  =>   50,
    "XL" =>   40,
    "X"  =>   10,
    "IX" =>    9,
    "V"  =>    5,
    "IV" =>    4,
    "I"  =>    1
  }

  def to_roman
    value = self

    ROMAN_FACTORS.each_with_object("") do |(roman, factor), result|
      count, value = value.divmod(factor)
      result << (roman * count)
    end
  end
end
