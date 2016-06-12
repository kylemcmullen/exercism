module BookKeeping
  VERSION = 2
end

class RomanNumerals
  PLACES = [
    [ 1000 ,      'M'    ],
    [ 100  , ['C','D','M']],
    [ 10   , ['X','L','C']],
    [ 1    , ['I','V','X']]
  ]
  def self.convert(n)
    PLACES.inject('') do |memo, place_info|
      memo += convert_place(n,place_info[0],place_info[1])
    end
  end  

  private

  def self.convert_place(n, place, syms)
    if syms.is_a? Array
      count = ((n % (place*10)) - (n % place))/ place
      convert_syms(count, syms[0],syms[1],syms[2])
    else
      syms * ((n - (n % place)) / place)
    end
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
