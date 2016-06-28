class Trinary
  def initialize(string)
    @trinary = string
    @value = 0

    power = 1
    for index in string.length.downto(0)
      digit = string[index]
      case digit
      when '0'
        # no-op
      when '1'
        memo += power
      when '2'
        memo += power + power
      else
        raise ArgumentError
      end
      power *= 3      
    end
  rescue ArgumentError
    @value = 0
  end

  def to_decimal
    @value
  end
end