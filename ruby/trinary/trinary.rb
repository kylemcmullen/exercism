class Trinary
  def initialize(string)
    @trinary = string
    @value = 0

    power = 1
    for index in (string.length - 1).downto(0)
      digit = string[index]
      case digit
      when '0'
        # no-op
        power *= 3
      when '1'
        @value += power
        power *= 3  
      when '2'
        @value += power + power
        power *= 3  
      else
        raise ArgumentError.new("saw a \"#{digit}\"")
      end
    end
  rescue ArgumentError => e
    @value = 0
  end

  def to_decimal
    @value
  end
end