module BookKeeping
  VERSION = 2
end

class RomanNumerals

  def self.convert(n)
    converted = ''
    converted += convert_thousands(n)
    converted += convert_hundreds(n)
    converted += convert_tens(n)
    converted += convert_ones(n) 
  end  

  private
  def self.convert_thousands(n)
    thousands = (n - (n % 1000)) / 1000

    ('M' * thousands)
  end

  def self.convert_hundreds(n)
    hundreds = ((n % 1000) - (n % 100)) / 100
    RomanNumerals.convert_syms(hundreds, 'C','D','M')
  end

  def self.convert_tens(n)
    tens = ((n % 100) - (n % 10)) / 10
    RomanNumerals.convert_syms(tens, 'X','L','C')
  end

  def self.convert_ones(n)
    ones = n % 10
    RomanNumerals.convert_syms(ones, 'I', 'V', 'X')
  end

  def self.convert_syms(n, small, medium, large)
    raise "input out of range" if n > 9
    case n
    when 9
      small + large
    when 8
      medium + (small * 3)
    when 7
      medium + (small * 2)
    when 6
      medium + small
    when 5
      medium
    when 4
      small + medium
    when 3
      (small * 3)
    when 2
      small * 2
    when 1
      small
    when 0
      ''
    end
  end
end

class Integer
  def to_roman
    RomanNumerals.convert(self)
  end
end
